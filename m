Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEA02147FE
	for <phone-devel@vger.kernel.org>; Sun,  2 Feb 2025 22:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738536375; cv=none; b=E6v97Um/DVReHNfo8T+gq226xRlycMwKdgBu6O6IF5YpdxEzZN1U17nQ65PaWbtivivAc6R3hhM4Ft4yw1zHleD50ssX47lDVs7JLYVLMX7sRaO4aFKYXD7Wo0cEkaWPP0kymZVVeyWTSCOVqwQN0QozdcwBPEIHDQKtouVuw3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738536375; c=relaxed/simple;
	bh=YnNSE/LPAfAe/u2HSLYj+o9uJBnXbnpQ9KgSWsMPZXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dfVMPgMzKTwBdKT8bgDvTb/1Vx7QlXuA5kv3bsE8+Kq//sBpt760+vv+QVhYIGeAGUiPPvReUho4papO7u6eNWCEiw6g/YvLvIP8YKD9xvNQta9i3HHzyRSV05owDQ7DQyG/IP1uy1M2iEqbMyh7Pwx45lLKbg1Hiem1EoR1Zvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=b7cID80U; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="b7cID80U"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so25648725e9.1
        for <phone-devel@vger.kernel.org>; Sun, 02 Feb 2025 14:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1738536371; x=1739141171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8RI53vn3X23eEEDFRotITDuCiKS/4aif1tdWU0fr4HU=;
        b=b7cID80UgQ+VIi32X4t5rICT6N4nRqY8owH39oNJKBX4CxW2CFyHStwaj66+T50RtE
         SCIBxAeefY9TLfR8i1rX1SV1b0ru9Tfw9luX5japSKJwMZx1JwmLTmCc7piSrpIVElS/
         +yW1nzLQN+uCDBg1qaqdrcnV9zl5ABc+YmcaeWEUdOGvGvYfoT/Yd5+TwDhHTY8EtT9Y
         oDRqntj+UQiEKpLrxTPl8fYy6L9MMAg/GJs4DjRwkLyoraOfWw102Zj7bdrbZdVdmqn7
         i7GywM7CVBUcsEJpflubFQ+nLPkbIlpCIcnjl4pkmrTZgCjcLaX4qViOFwPMKxGdBzcr
         c+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738536371; x=1739141171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RI53vn3X23eEEDFRotITDuCiKS/4aif1tdWU0fr4HU=;
        b=Q++gmbIkgaYPET/4dfJEdWFqM0zYrFkxao51u8jegbzR/nbWi+CfeuaB3gFAdC0iAv
         oHFYzE3xC+R+ffaanhyCtzzegwBbnbTtTihyvGGeF2Gaim/ruNPRkveSg7cfLqSVMFh6
         sVbTq1XeUKGqndv2YQLJYLZW7aNL5QluFbN0xQzEsObM3wIQb0BLfmCgN2Mud2JrTm95
         0LQNtCPPPhLVNQtg+525pb09ZbJ6oTr6YfogSel4FfvYYgxGFTCCmZO8M16sb5ougJFi
         e5yr+SZ4TZy/Yo40YpyOX6a21nyg4t/4c9duw3bTdb4cZfv4URnB7O0WCC4SFrTqh+em
         Qi8A==
X-Forwarded-Encrypted: i=1; AJvYcCXWRqBJXvs8/xFjwtrmVkBpgrWAbc/zu2ZIaJB3jAWj+X6QW40lMjodDJciF/LIyXs7GOXiE6e98Qw/XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyePZ/upUR7zVGnM3DBiTuFM02Ejc3fgUb7qdcJ8O3FAkZXtOF
	Prga0N0oXGoLLYyQkNs4RQG0PxrvN/DVZdfG7mshFidrhsMqJmF1hMxNtAVQQYU=
X-Gm-Gg: ASbGncvuTxzdtK4Orae1tZNTByaPfuEO882HYxptu5KkydbhFIaTX5UNBkHgaVO2me4
	LzoUsLvbze6XxFEGmCY/1upwPoA7ArBXlSsVZ7xSCdRdZNGGYPXY3dW+5T9XZgwfvIJT/OG+V9G
	aWzoRAtsw6yFuoz92UF1CGHnabe5TYwMMy1WocPzgPJVAb+dsN2GHhk8Cci3GB9ATGQMlfLQYlO
	3rqHdOys6okFl6FzCkjnTwoBlJ29t2BoAi0OWixDxWBMVwXZ1qS9at7VbX+YvdRRfIBv5HkzdLP
	+JhW98mYV7IhjU9TQBCgYBXoT2w=
X-Google-Smtp-Source: AGHT+IGBX6lu1OSNvz8aeULWff/wDITldKG3wzn8oH2zHYByjYJKUn9rdrJm/tqoC8tJVosKX2xovA==
X-Received: by 2002:a05:600c:1d26:b0:434:f5c0:32b1 with SMTP id 5b1f17b1804b1-438dc3cb5b9mr167114485e9.15.1738536371121;
        Sun, 02 Feb 2025 14:46:11 -0800 (PST)
Received: from [100.64.0.4] ([2a02:a03f:6bc3:6b01:62c7:350e:556e:d0f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc80e61sm170849605e9.34.2025.02.02.14.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 14:46:10 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 02 Feb 2025 23:45:52 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable the
 GPU
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-fp5-display-v1-2-f52bf546e38f@fairphone.com>
References: <20250202-fp5-display-v1-0-f52bf546e38f@fairphone.com>
In-Reply-To: <20250202-fp5-display-v1-0-f52bf546e38f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2

From: Konrad Dybcio <konradybcio@kernel.org>

Enable the Adreno GPU and point to the correct ZAP fw path.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 965e32473a58ae4748e4cb748980fad1d2b06ab6..582b19277de414fa9cbb8f9929c6eebd697e8033 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -651,6 +651,14 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcm6490/fairphone5/a660_zap.mbn";
+};
+
 &i2c1 {
 	status = "okay";
 

-- 
2.48.1


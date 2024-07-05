Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC87144D34
	for <phone-devel@vger.kernel.org>; Fri,  5 Jul 2024 07:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720165400; cv=none; b=n8V+LWKdp4TM1n79q8r1YGOX3WV+CYrnFqDQbHfAEKv2xti+JLkVKq5ZDyAAFaz7jkJrwJ8Y7XOaOqJt8CyR0N5HFRqYbC2WkQ3VWBqp5RMbh6fn2f1pKLP2F8CCEQwIyyj7zxR7joOdH6cm7G1dTQ5tNgObsby1D3NPvAu7bMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720165400; c=relaxed/simple;
	bh=xMRKonIgiBI78xXfSxg1vkO7UNb4VpdzvYn8LbbXScg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mNIDgpcbIKEppYfYIPj3Ih1EW7dEEwTLX0EP+5oUqGgzUM6cuM9GPcmrFELZrRQ4z3pdIgbtuzyqBxST2fUa0u07Mu3nQvvA/CmvDukuiVPHR4pOURDbc5FDZuU8iOEBgO8Fn4oLiPPwho55zo+5ztpuRQpbkGggkI3ahTQS3T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HuX/m0yo; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HuX/m0yo"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-58c2e5e8649so3591885a12.1
        for <phone-devel@vger.kernel.org>; Fri, 05 Jul 2024 00:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1720165398; x=1720770198; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8q0QP9vP7dfkRhnJhs06XzMUSeogIVDRANFYGZhnly8=;
        b=HuX/m0yowfHdvD3KXQTAhFJbOjw/DEgE7WLdQKw8aErbayrpILKN6NSg/e1r9Nl3hk
         wfHXsfcyUQg6iExYdhGUdZ6gGYtW8821Udliih9okRO6Cg6rwkY53KYwhYnEMvDPEH4R
         YVECwLPxzdzEzkM/muONsXPP1FHIwsnugQkvO2iat5F85lcjyKRS+bhS3lvrsbVbt+N5
         F1kP/m07QgVy0rl7xYdd7XIwJePf72oEphVhY/LYgJ0WMawnFmYtfRtaZyF4tJIjy9ek
         AIfJNGuaIAUVOc3sOM2pNWIfza1pexrRImP8ExqQRnYzXC+LGz3Ol2UryoUtobqR//Ft
         fBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720165398; x=1720770198;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8q0QP9vP7dfkRhnJhs06XzMUSeogIVDRANFYGZhnly8=;
        b=XqL2c0nal6e1i+mhjBm6IoT8zGn1PAC4y3pI2rU6aRfmVSVhb7zQT6vIvm4tqbDjxy
         2/GAKF0xdGjznbU7d09HksTYubXXUB75mioMwL9Wrm96sczzzonYduEko3Y25q0YlBeN
         QQ7sgLSwGfZEYiEwVGs163ndFVL7MFAoneA+wc7bprXgeaXS5nIoNaYB73Vs7T3fuRZs
         0FGND03hsp42EFVFGdBDexvzGFMlTZDiASo3eLwwPOa9kEbMkHO1yHQUb85eEK9W9pVW
         l+DzHpg5KGqPGZ/cMmhYoLQrU47WIlfcX4GqWkfw2f73jz110TqC3kYiFvR3RVvgu51k
         yIeg==
X-Forwarded-Encrypted: i=1; AJvYcCWEOHxtBtRL0pudIDPx95qPYWsgLe1uHjYTTNXNgs98tIDfHqLJNskaIU3Rj/bFT+roacdZe2JLzWIlceWTVUVSoAoxph72QDyElcU=
X-Gm-Message-State: AOJu0YwqTM6WXV9+q2e4WsDtgcX2lEw7l7K8Nn2eDyUKhzVd6kfkH22q
	Lo4SPLSl+Ycw+J5J1QbU49O1397U10l64ArJ5KYt0imdQTzMdjqKTAYOfukJNQI=
X-Google-Smtp-Source: AGHT+IEFQtKLC2KR8SHNPEDd94zyKDCx/t4ohydEafRFmL3Th2JhU9ob/EKwraM6v7NFE/PI3+olHA==
X-Received: by 2002:a17:906:f882:b0:a62:e450:b147 with SMTP id a640c23a62f3a-a77bdc1f137mr278703666b.29.1720165397555;
        Fri, 05 Jul 2024 00:43:17 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77c832813csm51332866b.119.2024.07.05.00.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 00:43:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 05 Jul 2024 09:43:11 +0200
Subject: [PATCH v2] arm64: dts: qcom: sm6350: Add missing
 qcom,non-secure-domain property
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-sm6350-fastrpc-fix-v2-1-89a43166c9bb@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAA6kh2YC/32NQQ6CMBBFr0Jm7ZhOgVZdeQ/DAunUzgJKWkI0h
 LtbOYDL95L//gaZk3CGW7VB4lWyxKmAPlUwhH56MYorDFrpRllVYx5N3Sr0fV7SPKCXN1qjnL4
 05NTTQBnOiYs+oo+ucJC8xPQ5Plb62b+5lZDw6klbx2TJtnffS5pDnPg8xBG6fd+/uUjGJ7gAA
 AA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.0

By default the DSP domains are secure, add the missing
qcom,non-secure-domain property to mark them as non-secure.

Fixes: efc33c969f23 ("arm64: dts: qcom: sm6350: Add ADSP nodes")
Fixes: 8eb5287e8a42 ("arm64: dts: qcom: sm6350: Add CDSP nodes")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Fix copy-pasted secure vs non-secure mistake in commit message
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20240703-sm6350-fastrpc-fix-v1-1-9f127de17175@fairphone.com
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 46e122c4421c..8b9bff38e687 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1323,6 +1323,7 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -1582,6 +1583,7 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240703-sm6350-fastrpc-fix-760d2841d0b6

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


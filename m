Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB6E27F74B
	for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 13:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759240641; cv=none; b=sy0Dlz/cAd1YpKjDzYjyV7PcXltwbFaPV+seG2WSf+vv38GVH7Fzp+WVZqYBdgOjYMIO2N8nVFiwVAUm5iG7OinFrgJGA7S18/e5D/yvNEsxmGXvGMf+JShevEr9OopB9E7ONE9zMu4Xy1l+smQxPshtFgKmaUIsOadeMb/tsvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759240641; c=relaxed/simple;
	bh=tzYiBi1inoE6AQKDp3BZER5u/OgLXaF5Dw3TSJH/dpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VICc9efsfKCxS5hcsDUo92NqSFyF8X/Cjx7XF9wfU6qsnYKis8hSWM6yCn6s4KPu0TgQgT7QtZTrXdJna1xqOf8u6UvQ6H1D/HAFwVD0goSB14p+WH3VVBcLrAQSZkOv6bO3ywjxXpUYn1SOmtrCMp4unCqdUhZB796E7wfRqKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Ii58swwd; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Ii58swwd"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3727611d76so861481466b.2
        for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 06:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759240637; x=1759845437; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVfHh0PGJNCeCUt53q0MGqTcrE5zWwJY78oS+k48p74=;
        b=Ii58swwdeXSxfwH8WC/n4oK0hwSUPc+khTuCyt3sHvSpgxgDK6AHjmPa4x+JUa5bfq
         d0zHSFSPDbTTc3OGGYmUB4VSINSRLuYcirQj3yuatR5y8OfIseqqflOqc2zFJcac7GNR
         W09Ou7Lri4x80uwK6d+OfTR9/VU/h43Qsbj6het5Ron1cCQTnEzMF86OsxmnPFwb7hZt
         ko5Zb25w01zd74XgcfpPS3EXmgUz851QEvwO01e+537Xe4ygWIggQHUsfc9ANYcP8XaE
         7mnk36AwdM1BGFHqBgHi5WbvJaIYqVka3sL4vcp17JPJ95w8ZdNtbdgwVz3OI19nd0mr
         nowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759240637; x=1759845437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVfHh0PGJNCeCUt53q0MGqTcrE5zWwJY78oS+k48p74=;
        b=W7XYjJPlB8SdMtjXZCzTiNCMY/GMe+GJ6VUt635yltq+cMRdMrVkKEFdPyHRDtozOb
         x0TmjlrD2SyOs9dwg9SDGdU5Rdj3wDJZfysfsnz3G7ixvE+nd6t92OcOYVZkq4gEMf53
         JJ6uj3elAUfDG1gSVlUfaWERfeZ6/88p1Xi9ATWJlrdc7t//LuPKMEN3njYGdOMQutOl
         F+M+CG7wd10y0n/MYTBrMXfGCmkItmDkcPM/loiXZf8FJ+mu7hIrmEzJM6yQ2vP6Zmv4
         OrFCXirdYpJrztpiCX958nZP2d1h3HfwVwZT99xKFF4yAuQkhU1k/HxCBeEL6Yohj6sB
         WeJA==
X-Forwarded-Encrypted: i=1; AJvYcCVL5NTi6BV3hamD7CvxkxCe6abri/KD947DsEGxBWyASnoEf4lPtFn0Izq57pIuzUKXHOwKFD1gTebrbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5mjjh5YanS7OABVZMZQn5hbTXmVn4EYBN7jMJ7EzB6oqQDsax
	9VwVX2WCig1yQH3vgmLBPTF+fiCmbYnsi2PEe6WsJVwXRrZlBbnH9VHTaxjvuLkgbro=
X-Gm-Gg: ASbGncuuhewtb+KLQwHrAwLYw/XG+lpHyB7/CBEmX5zpBOtqHmHHqH5BlORyWyuTPOX
	u2paA9pAtaXCVlfu2nCoO42jPp6srTyDhKUG1KDXNFzYWhfVrFwAsU9a6z/siBW86ZD/wiCBjlP
	pYbbrjaefZ0ZgxeCiLmBdH+Wx6auFT2Rtbr7WW4yv8bRKMuRJAB92w22VcH+Uh1lXZl20PS2Z6Y
	SZDeysVIBki3NPDQFsaGLNuu0ySCaEt/lVgak4kn4qGjuOL9ZD9kPHOApR+gW9fFeZtH/PsgPUq
	PfySoMfrViUmMMwjC9rDbtUdKfdxBHvcM5V+vqHphkI3UZEs+4xLJ3/5+qFT1zToqX/H7s6/+gK
	zYw0eHdE/Dg3qhXNcmyYvebN1pyYK6qqWlYz2KjIfXbFRs/rVeOfrGMBq9LX+f4JA2UVLkcPlgt
	zzSRjkx/CwwAMJd+gs0g==
X-Google-Smtp-Source: AGHT+IGYpOyuHrV3NMYdDmii+YAGqD9Cnpv6UIS+kz/yGdm4TlrhmHWe/hPo+Kke8kFGDiqYhnt+MA==
X-Received: by 2002:a17:906:dc95:b0:b40:33ec:51ea with SMTP id a640c23a62f3a-b4033ec5d68mr618735366b.6.1759240636824;
        Tue, 30 Sep 2025 06:57:16 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3fb818fb90sm370234866b.63.2025.09.30.06.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 06:57:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 30 Sep 2025 15:57:01 +0200
Subject: [PATCH 1/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add supplies
 to simple-fb node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-sc7280-dts-misc-v1-1-5a45923ef705@fairphone.com>
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
In-Reply-To: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759240635; l=966;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tzYiBi1inoE6AQKDp3BZER5u/OgLXaF5Dw3TSJH/dpk=;
 b=yTOVqbRldO1E+tGjFjGAFseABV4r1qByu1pbbAcH2yqG34o3vjM4uLWD1TvE2y8YIsU+8DoO2
 G4hPBGFUKpRDRrmcoYfv2t1HJ3SL30mFEMGZegh79iZKLBCX4mG/+85
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the OLED power supplies to the simple-framebuffer node, so that
the regulators don't get turned off while the simple-fb is being used.

Fixes: c365a026155c ("arm64: dts: qcom: qcm6490-fairphone-fp5: Enable display")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 519e458e1a890814e5135450c60e5c71c1b75a81..36d5750584831d66b4c2faf6042e4cbb3274eca7 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -47,6 +47,8 @@ framebuffer0: framebuffer@a000000 {
 			stride = <(1224 * 4)>;
 			format = "a8r8g8b8";
 			clocks = <&gcc GCC_DISP_HF_AXI_CLK>;
+			vci-supply = <&vreg_oled_vci>;
+			dvdd-supply = <&vreg_oled_dvdd>;
 		};
 	};
 

-- 
2.51.0


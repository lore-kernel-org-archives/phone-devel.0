Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACDC2D94B8
	for <phone-devel@vger.kernel.org>; Thu,  9 Oct 2025 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760000814; cv=none; b=HN1CSyBZwJCUjeEJ7YztAerD/SGH7K+lIxilol2OLvKmDs6sebeD4R3aNH5zcAR2158o+Ix5UJ+DPPXVh85BnAqrpAmpzvKwT8uB6UWlvRhOw6pD53I3HCp6d6/VGgNpichCSyi5TG0TfEhIZBDSmMBicglsxvS21zPEVlNfPL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760000814; c=relaxed/simple;
	bh=6c+LDrNFsl3Mf/zVKIj375u+Xy0wPf0+vzPBVIwWGeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y7dK++K+o+Ub3qXx1WXvew9JkR2hvZpmB4FMtYe7Bn94v9ysECLUXyCCUBcdAhL3tOzzXVK/E7iJRBFpi2zzD0sgSdkyrkYsY53ETcSaQEggIfzUhMKKOcnd69zGoU1mkP52b8jXSjsTa44bcZQdngORjC6EQpzIJ584oeF9ykQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cAie7e4U; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cAie7e4U"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62f24b7be4fso1227500a12.0
        for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 02:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760000810; x=1760605610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ekJw9Dpe4LT8cbettXRBucWkmba5D2JfYHQVJm3ydg=;
        b=cAie7e4UuiAbHPLhkLohgg6i1tOMLJIjPqHSrp1ROKvr8ADW+Ylpr8kiaIzuGnpk5/
         0uTuGEbCpelqA6/Kh+lELV6Mg4VRfHp31sIHYLtKyBbaXjvMQq8kQw/tdCwRkn+C0dTx
         ntSVi9kImsQLMv1nzup2xWIVQ9o99XI1HU6nW3hjnocLkl2uHK8ZiHuLjjGgry3YWxhb
         y8MKP7VIblGwTPx99Vt2MIV3ug8sVbax9vMfzLrpFnGqNue/DoCS/y2uCFzj42C+/fHD
         X0/DqSbK4svp8l3gCIvxu3knmQ8l36NSol2NhHp218o2kT7594mCo+GJPhuqC1VEYQaG
         0diA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760000810; x=1760605610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ekJw9Dpe4LT8cbettXRBucWkmba5D2JfYHQVJm3ydg=;
        b=jxMqqAcWJHvfwoPxeZ5jfCkNBBZV3l87rvWYUFUPBFGbH3JswjM8rKibwGbW3Oq+V/
         273eNYYRN6d3HXPFbEOJ3pnIuqjfJin833BWRoEVU30QydwEyA/IjgOw8ssa1Ncggb2E
         x5S4DkE+PTALDJI8wk3VAO8HG640oGo3NMwspjEm5vzR1MqQrlzz4owNMzF4TuuufX7c
         5dD+ngXB+VcsEGC/HOzKk3LOe8zMmUinX5DfwZa57I8lvSRip+/rke07CXIvz7s3RL+v
         jrSKCpebdmkM3Uing2n+ek3+lEkXfKQyxOhcJDUJNxJElBePfc8quF/d/YCL+6FukitW
         1sfg==
X-Forwarded-Encrypted: i=1; AJvYcCWP3Ulmg/j7/p8BSN3THMObAosZtFkkRqHz49tGSpEPd4BC2/59UqwGiS24VGOG06qlXrr19crqlSDXlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH13f1RhbCUUeUXXgrO7e8STQ2Jb5Iuy69NHHlEgWv3oue2dO1
	EP7pgXOVGN5qpRTDm3Ld4UV61oDx0J5uhvoXH2Qn09iDoKia+wnawpz34BoGbrN5eYwP25DuukI
	cKu1oeo8=
X-Gm-Gg: ASbGncsN5yPtyROry0RYWh60Wn5SKPDlXs2UQCn7Fj4OZFd35+usuXQ4PVtZ2HZ3vM4
	GiwlOZGuIizqPjpBu+0zuMN2/TXOVpeRReB7bdVB6UZOlw/vUVZyMG/9xM4R/AjRDHZllRUvdfF
	LeAqU/d9VjnYNRq8gNRtbGYwQ8Qj9f3kUDQ7sQ6xK+8aGUphA9o85WwWpNZK3yP5t8tnbtltLUa
	P8pE5FCSgVAOT5LI+pFcb6YygAGYRLU5oWPuPZjP1jobTgTmnDYAJihvPWqxWruzXNhFSd1+jio
	oVxvD8CMseTnhlC4HqCkBR3vkZ284Xr6sHUc8O2TWTwlqzArHrI7nnj3XzHDiYSiShjdwj8KzYZ
	OCYqPiDDeFwCKO2CGYTu9PIpHqr/hQMZh52O6vJ35lYAKlpiSdT1ofRVsU17YRiNF8e4iUNpX20
	5VjLOn9CuSqNUQaz2/GGNpTRfyBoU6
X-Google-Smtp-Source: AGHT+IGVnju8p0EtiVRVfPYKo2DKq9aqai7ZQykeesawT2arQe+oRNmMFYDi5jeeocRAxFAQMHEcgg==
X-Received: by 2002:a05:6402:210d:b0:639:e712:cd69 with SMTP id 4fb4d7f45d1cf-639e712dbf2mr4128487a12.18.1760000809554;
        Thu, 09 Oct 2025 02:06:49 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f4109046sm1905755a12.44.2025.10.09.02.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:06:49 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 09 Oct 2025 11:06:35 +0200
Subject: [PATCH v2 5/6] arm64: dts: qcom: qcm6490-shift-otter: Enable RGB
 LED
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-otter-further-bringup-v2-5-5bb2f4a02cea@fairphone.com>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
In-Reply-To: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760000803; l=1117;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=yyPwwquHQ/hor9rKpE+9NwLbamAj8RJZBJZ1Khr3/vc=;
 b=z6PdzX5mDNnT5WJj/LvOPGdVhBBtxqgjFNbSFc4dXE8k8eCqz/pKrxJLlPzBNCJXkFHDd4cxx
 tepyVBNdHN+BrD03oBFeKB3I2JWXKuv5ol87WIOaChcKJkalYXqz06O
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Luca Weiss <luca@lucaweiss.eu>

Enable the RGB LED connected to the PM7350C (PM8350C).

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index ac6ed79e57b1..af6f7b41201d 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -618,6 +618,33 @@ led-0 {
 	};
 };
 
+&pm8350c_pwm {
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+};
+
 &pmk8350_adc_tm {
 	status = "okay";
 

-- 
2.51.0


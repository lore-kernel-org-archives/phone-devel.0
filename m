Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C24285CB8
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842702; cv=none; b=NJlCm9B9v7t+ulJSDrzgdjjUTBtd+6wNMEeuxuvyzxujysbUqFBoyPdrXCGj2lcMjPRlFJo/w2p/A//Lq8qoZiR9982LVk8J0/dfzN0w8omVTGHmHwZFgIPhxni/6HADwr3/7H76mzchp3+LS4Rnh4x8ITGHxVMspkrJNn0SyIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842702; c=relaxed/simple;
	bh=20OgU07hYw0BKvki0Oaix0JpyTN3z8RUI0obpczt4ZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aQ12Z2FaiewCMkDMp+bpY0Y5fZVnu/7bg2Wr5/RYlVPFj0lmUc2TH4WmcSz9C6GqnL7ND7IoJeiBXwmxalFV+CACFo0Wa0oDNQbf8PNNAEbb1SMy8w1Ulo979voZzuQxPtnXWdZhnyKR9LdIsBypoALOR77ntQhIJmsAhPmSOdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=LA8l7xCC; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="LA8l7xCC"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so272618a12.2
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842699; x=1751447499; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uMKYOxxD7UdxTP/ee1363S4GDcIjdo0gX+UMgMSM07M=;
        b=LA8l7xCCcO9COtBMNSD+0HzPlMsC9vYezNo01bYnblQcNA/yCbIrI434lsJidHFI8Y
         Y7OhoTnd4TNZBOL4BO5UFhv/foxW/3kSTV2J2UjQqpyg7jdCtsPKf45y1uOj7aaIvkbw
         ezs9VH6Lp2woTb3+/h0F7EB+aENYptXVroPkLD9v9jVQl3+V+9rJYE+tcpxYI0xvUNil
         AwpWximdECgYzl5yFGKngL6/tGQSx303sBbgOUUP2iWV8zv0OL2HjKTK2MgxcnWBYqFl
         B9Dm7SqufpC2sva7t7vHQmxQcARIQLwNZC0oMM3wQ4o01bEMcuF6Bijljmcfg36CNRTo
         tIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842699; x=1751447499;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMKYOxxD7UdxTP/ee1363S4GDcIjdo0gX+UMgMSM07M=;
        b=CqtM5URzDUWkoL/MQzu7oLq24O3beuqLtWpSpdGkEZahJQvbwwsPvwxMGdr1DFbKeV
         fZu1t8QogPS7h//B2lrUZL6Xqc4j6nVA4/UFBKx/JEuHQWl5AZNJxA67XoOR+/hkhSzF
         ht3o/oi7d9wEEsiVUCNBSbxTZG/ZVHLhde975JiQTyLvQIkVlBp1xlvUtIVhBZuxebYj
         Wgtvzn3titzVLipjPUtI1psJh4a11bnj6Lnso7rsZqw3DTpI912B5AYMn/ekIjw8IBQj
         skrMgy+i9D4t1vs++fjxLUfkADqe3PQW73fjrFRuguHY0ch/8zjM1oChsCT7+PIK8+l5
         e/vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJpn2ZFPMBmqhzZcxX8E1LAPD0KAwhi/9jNObNzpImachfp34IoFzcGwJnWuWLCi4RyVSsa1iBT5ALdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQc09BzqT1JehMYhsf7CjZoPOXCtmr4kWGg96edQvmBY51F9G3
	V7uRHgwWTKlGrBLyESLkMpFKbHvXn7JT22WY5yefTcd7u7TXtwo7b2MCBY6syKPb9EM=
X-Gm-Gg: ASbGncuNzHwGuaR0W03bhZC0gChAs6eloRGkSJGB7RHlKW3w4wkxszXUmkt4UAgSDId
	ROM1rORid+m/qd73CkP5xfQ33BfGkgWlB5MkWK+vb7HuHYahhr7yUZRmWLPIwoYbMbVaimZC0AX
	KVlgAzkf/Lsl+ki65vQz84w8C8+ZXe4NrQ2gvAa9Ia6mlqefd1y9lPDlKjOWTjwZebW9ogPNsnc
	2Orec3e2ItV1juWCCov6tn8djJzH6lYPhkHAThpU8B5Phi1dnRV8IUIaWFzOxoeHVkXkHlshzrj
	wpPk/R3nx0cbhtrnikjTe97+ZQu5A/4k45s0dHitkxQVh4p9GezVAvstomR+KXHubk5pds+3gby
	0FnuXpljO+Rk6HjTIMvq8prvcVLjiGWmK
X-Google-Smtp-Source: AGHT+IEc7/hN2f9cmghjg+sMULShIBvhh5KvCrY+8l12A4p/2NB5EXrD1TehNzU0qc52lkbGcpeGcA==
X-Received: by 2002:a05:6402:2b95:b0:601:89d4:968e with SMTP id 4fb4d7f45d1cf-60c4ddc2ec6mr1441560a12.27.1750842698815;
        Wed, 25 Jun 2025 02:11:38 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f485d0asm2167101a12.64.2025.06.25.02.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:11:38 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:11:25 +0200
Subject: [PATCH] arm64: dts: qcom: pmk8550: Correct gpio node name
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-pmk8550-gpio-name-v1-1-58402849f365@fairphone.com>
X-B4-Tracking: v=1; b=H4sIADy9W2gC/x3MTQqAIBBA4avErBswzf6uEi0kxxoiE4UIpLsnL
 b/FexkSRaYEU5Uh0s2JL1/Q1BWsu/EbIdtikEJq0UmF4TwGrQVugS/05iRUzkhS7Wh110PpQiT
 Hz/+cl/f9AJE4wKNjAAAA
X-Change-ID: 20250623-pmk8550-gpio-name-3fa2e349d567
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842697; l=992;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=20OgU07hYw0BKvki0Oaix0JpyTN3z8RUI0obpczt4ZI=;
 b=wdifaQe+6/HlEDQF8LAH/wkqmOA1J/D1j9RVM28OKGvP2EQPBSEIw3ic+R9Uf3/dOocYrdNGd
 OSrCrGT94wkBZ+fFM6Wdza3osAI0Fsm92N1CGDGA6RUbsmWs90PSKxp
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The reg for the GPIOs is 0xb800 and not 0x8800, so fix this copy-paste
mistake.

Fixes: e9c0a4e48489 ("arm64: dts: qcom: Add PMK8550 pmic dtsi")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pmk8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
index c7ac9b2eaacfe6e8363448d9d2ffb4ac8f5f4dd2..583f61fc16ad570972ac166aef12183382ebb4c5 100644
--- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -64,7 +64,7 @@ reboot_reason: reboot-reason@48 {
 			};
 		};
 
-		pmk8550_gpios: gpio@8800 {
+		pmk8550_gpios: gpio@b800 {
 			compatible = "qcom,pmk8550-gpio", "qcom,spmi-gpio";
 			reg = <0xb800>;
 			gpio-controller;

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250623-pmk8550-gpio-name-3fa2e349d567

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


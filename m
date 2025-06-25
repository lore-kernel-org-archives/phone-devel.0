Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33002E0B6A
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842911; cv=none; b=IHV2yQH05EjDfOjZ83ClE3HOPyXt4Ytj+DbhXjbyufv8HlyEkl5waIJkalAA/jJLr91cz7zHSHKGJOojzRof0znlX/zHk1tr7blk06RFvk2p6FTo0wTVa1Qu0r7kJ556xifmaNlmKosqsO85uvLf344zXcKSXT+UuyUReojMpf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842911; c=relaxed/simple;
	bh=aHm0Jgy1AJtO2/QKW2dbDq0Za7rk572Z5sUBzOZUKws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MFGRbskfnT63xxw+jZOL7j8Bkd2xJdXeLLwkraI3d03p08b5HRd+tOsyILviPaMEFTmJgyZLLTtMGX6c/bZqiuHMOZxBmvmaLCWSKGMMmNy+ijqtOSdEtIHGqSZbXqK3/olDy9tDJnNr4fEPV8EhXpx3pBIneMktsX0APzShkUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=y/cSamu/; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="y/cSamu/"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ade4679fba7so239594066b.2
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842908; x=1751447708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNbmjsRfs+5MKtBz+Hc1str0LQgPAk3FDVI40gqDF30=;
        b=y/cSamu/KYUC/mwBldPIZMs/t7e/8VV7CjxIT56XLZCPuLx4l7ZAR8dPazZU4xKJF+
         85IhiRlT/K35/RPILhkdJw24hOt647U4fHLQz7dIVOGpo8NIHzIOnboyQFhBTANZ2smP
         MwaPb6beqCWKh2ws5S2OtUYOEIBOmzh03q/pZ0XqRhVrbdPdc41DeUzJ4QFbyMQCvlrS
         knxutuKPrGB9ZL61hWRxRuk/Ih6c1nhjvYVuJWIHL8fUsKU/4OZM9E0tVxFLC9QeHY8q
         ra2XiU6n6WXReyxZdK8FUT1fSkr+ZV5V4yEAUDllDjyuq9XJAyUpyBGxkqzW9OLyjzco
         5zWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842908; x=1751447708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNbmjsRfs+5MKtBz+Hc1str0LQgPAk3FDVI40gqDF30=;
        b=XMw2hEMBHVL4L3TR4kOlQCk0oBsOi74FpLF8qs2J3PdfgjEPgmQ1swbwkXpdQj7xVJ
         F/6PC83gcLSF1ebpIpqQcXhqVvOji08AmeInozvDE+65i3dQooZEf33XJnk9JMXMEJFI
         9BSOX5PIj6kxXNhsjiBJ7+pCKeshadp4SXeAk2vS/E2GGdmrHtPKm5tF7lUFOy2mYnIj
         iDRyd/4w5uKrUfFDf05CMlr4h5cd19UO+qWon9lPSxErqCG6Yc+xKiXRs4/qF4zIVKcf
         1frkXRl2LpYItEb6ZvcZhnbLT3psb9CrdSIRwTR+z/QptWhLWEWmqqsHmvON+GTFesv/
         SnEA==
X-Forwarded-Encrypted: i=1; AJvYcCXFlycFA9UOwqinISR6zW6At37fqpDGKytz1dKfl+9Pp7PFs8Eekq1gFycRetsRmNFmfGAu3LHN92sMdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGNmg1ys0zMZzSE+bJp9CK/BmVcdEfnytNNNuNE3tHCQXgzz+I
	FujisiHS87bkrU9ns3J893/07xsbljWNVgEzm8hZmiOkDMPMmbqjaje6l7R4xpviIBg=
X-Gm-Gg: ASbGncvb1g1uQIvD4sJ/1j/Tma1b6Xs7H3XpuH1Uj4ypvy2YuonjRDd50Vq43JuUIo0
	Dm3rO6C4SjS/WFSRXgZZl+EOCECvMKaJ0xv+oH93hDixRS86rDsvFYpCAaydw6e44mIgBxYB8bD
	NYF8dz6nTJ6RTahCou9Ojk4CcdQu4NpVDIx+J+GX1Z4k0rZsNDmVD5YJZ5JFNeodyT93YpuJIPK
	Oy8ehiJrHqTh5LjH0+JTiCkEVzkrCOxIYwjsRbIH0TBGOrlQzG0GsSX1VUY3yIE2/llUbapMQfV
	MEHhxCQaGQtYWDJWWJBMoQyK7ZcdraabRb5/ZIxOMnVFc8o7YVDdgzzC++BpKOKl9ujANH78SUi
	fy5OksXPrhE5ElfFffBeOGX/c1PXUIxqE
X-Google-Smtp-Source: AGHT+IG57CJz1isUSxtWVBBEYQRRLDGKKU4vhjDr8x5m4ljvRrFsAIMJQ9U4pd0h5IliaKEAweVcYw==
X-Received: by 2002:a17:907:9085:b0:adb:41e4:8c73 with SMTP id a640c23a62f3a-ae0bf216613mr160528566b.55.1750842908235;
        Wed, 25 Jun 2025 02:15:08 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4c2bsm1008972266b.71.2025.06.25.02.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:15:07 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:14:58 +0200
Subject: [PATCH 3/4] dt-bindings: phy: qcom,snps-eusb2-repeater: Add
 compatible for PMIV0104
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-eusb-repeater-v1-3-19d85541eb4c@fairphone.com>
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
In-Reply-To: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842904; l=892;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=aHm0Jgy1AJtO2/QKW2dbDq0Za7rk572Z5sUBzOZUKws=;
 b=VoHPW5DMLvNPMM6DDkiYwX+LlqHDBFUGbIVQ1Nh8rd4tWymfU9M9U6C73Yan+YQLqkLap3kKf
 I7X99swY3UvB8Zq+wjtFZbCPYxBkueCtQoSzMtpo3vM+aIUkFEJTORx
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a dt-bindings compatible string for the Qualcomm's PMIV0104 PMIC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index 6bfd11657e2992735998063b3ca390e04a03930d..5bf0d6c9c0256300d00f84307b7f6ccf669f17c4 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,pm8550b-eusb2-repeater
       - enum:
           - qcom,pm8550b-eusb2-repeater
+          - qcom,pmiv0104-eusb2-repeater
           - qcom,smb2360-eusb2-repeater
 
   reg:

-- 
2.50.0


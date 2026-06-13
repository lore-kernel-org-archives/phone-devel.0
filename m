Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ABC26CE2D
	for <phone-devel@vger.kernel.org>; Sat, 13 Jun 2026 14:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781360471; cv=none; b=KOFHOfk15xoptyUYwyFE66Mtlh3UmmvAcG6Jeai/c3GO96ObiPqoSPyAkljzEXRsOCLZR0lQipoFzmZlWqv6RUexAXbafpu/Kr4+xDorqhfQ5balefDHL11O89GW+LmMBaSeW4HUlPcQVR7LeQtq5ae8ZwY6/w/iJIr4uWAiLmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781360471; c=relaxed/simple;
	bh=dBKjpEpWIY+YoZpaXSyTr1vHWQHSlPyQ7j+bI/CPuvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GIqBdBFMAzB2a0Ncyf/iEYUzbzxh0rqA4Zh7+8k55CjUnkJyYQenKPTWzvoLh54++9+DiDHxxzCiDvbF2jCIIzKlr5C/kGldR+eNAU6xfW+K7xIq7dWUHBTmaL0pdtGPCVIC2jn7KikiaF06YgCReZanzdxWlrK5gDN49uE5nyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g81P3dn3; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g81P3dn3"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so1104083f8f.1
        for <phone-devel@vger.kernel.org>; Sat, 13 Jun 2026 07:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781360467; x=1781965267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6ohP8dsrr2qK8qEWNnxQ1LBIqyvgS8irkA8ITgD7Yg=;
        b=g81P3dn31CcomZ36pvcumAMuTEUL8BcnBvPTmcQU9pszc+2YgN8FaPiDfNpz3QJBo5
         uKm6qGabHbasYU9eMcIKUD+r10i2m4YOyf7LzOPwpjui9hQC+MklWwQXiASUnq4S93yB
         n2Wl2xoTvrc/Gu/3StTiHELn1wXKkQPkM5EKWlM12V6qdaUvMxmzFJQBaZXZzk8fEebf
         xUgcDtsEyPAtXNe9VxhOvUl9DtaTOs7u1/0oKz1dZuFRgTCvN/UjCCcPmcL+1QWWYV6H
         kGXAccz4g5mmL8s7EqImfSxUoPSeaNmVukNu6WSom5h2sgIfY591YpLfiby6UZB9mf8k
         f1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781360467; x=1781965267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g6ohP8dsrr2qK8qEWNnxQ1LBIqyvgS8irkA8ITgD7Yg=;
        b=RhQpyVqd2PniUNSOjkGZ2F3oYBsQYvZEimew6dylZRitJxG1D4eYb2NBI3LHAXADES
         nALy08/eGtKaqnZ6xrNHqcdj1wNrvDGVm2Wdyb1sQOGvpK0l0qQ0aTqJJQm0oR2EdVkB
         k3eyxWgK0GdDOW9U5RGLhv1LUzVJtC13b8RrOx+yr3fOE1Wl0e8O5KRxHj5wlBU5GtUm
         WIhp75X+8bB/3yh1gUczk5/WJf2VPBrB8ttPcIlW/sc+t/H7v9PmI1Bv4eTQwlv5MDtV
         SJYzvB0jwhkigPYfzyVBNpvoVKrsz+uv9Hw7rjXsXd7q2eW5WTBq2awFlQvXoC6zHFHk
         xYZA==
X-Forwarded-Encrypted: i=1; AFNElJ9kfaiC2BL7RAeeeQe5FQFdGjc65ksxzaJB0TNn5Kh28/y8eq/nvd5x5OiG7pDfJ1tqnVkflfXbGRH7NQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI4xmpukmimkolQH+V/TG7bnyJlEa6ulRuyXJdRzoPJoNnTyFg
	bHxq9oVaWdZYddUZuMfvTotsVvq0hTH6e3M6GSRI/5u6Aa/S9d8+xUVnMIf4ju6t
X-Gm-Gg: Acq92OG4raRLjePCXzh23FgZIs8lSd5y/BHaKy56TkTG4FbujEuSrvZaSA7Xp+5Ujaw
	F4xE1GKpxsbNJ1ugod7ft+oNGu8jFrUESfaahqmhkumJ/eJlzu3NyvUlkwcHKDqbA3XS+HLG0YN
	I4FT4boebTQYHTTkUwavsTuNAp28IMLNp0s2T2sJsgGDsed1lgCEHXEPcNxL1ihv1m7zI6r98Mw
	Vza5A/Y5XRSvBHw5l9wtGCuB6g+D1CjVcg2irjIHCOps8rsEXmuZmW2c+8krc8egLpCoFEE282O
	D+ZvAmUxb+ZinFXZghYCtVTdJ/DuP/PO3r3DfbiUl+/VkVFIni3zSYBpwe13kGD2DDCxHLTYrJW
	euhpdWHFGOsUGyi6dCntESPFt+vpTHpxXle/nYgd/6IrT74rv+lVq7SHLSP2+o/8S34QGOFOFHI
	HRMXJSRXAjwSbITaH9QngkGeK4FpvVLhkPVLQa27iEy/bW8rS9B0d/KWqqxOK0V2llphGnac2w/
	vAAfqmy/mEVJBCGnyk3e7Y=
X-Received: by 2002:a5d:5d13:0:b0:460:e2e:6e2b with SMTP id ffacd0b85a97d-46074a8a1b7mr4764639f8f.20.1781360467298;
        Sat, 13 Jun 2026 07:21:07 -0700 (PDT)
Received: from [127.0.1.1] (93-143-178-20.adsl.net.t-com.hr. [93.143.178.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26393asm16827223f8f.5.2026.06.13.07.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 07:21:07 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Jun 2026 16:20:53 +0200
Subject: [PATCH v2 1/3] dt-bindings: mfd: 88pm886: Allow vbus regulator
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260613-88pm886-vbus-v2-1-021dfb02c6bb@dujemihanovic.xyz>
References: <20260613-88pm886-vbus-v2-0-021dfb02c6bb@dujemihanovic.xyz>
In-Reply-To: <20260613-88pm886-vbus-v2-0-021dfb02c6bb@dujemihanovic.xyz>
To: Karel Balej <balejk@matfyz.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=4gG38m60zNtEceURSA/5gu2M6BW5gWxnRcLhKQIPpkM=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGLJ00wPc8//v7OaWc3aUXjs3/r8aj1yCV4Lo8psHf1mpO
 DyU/x7SUcrCIMbFICumyMK8VO4SX2r4RIci2ySYOaxMIEMYuDgFYCKXnjD8L51m6KWwbXZmxVfP
 2ZttfJl+nr0/xT59azrTDNcN52sn72P4718QIByq+DDEfIlMQpKw6O4PV6Rao3kWLXpXvtyys/c
 FGwA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

From: Duje Mihanović <duje@dujemihanovic.xyz>

Add vbus to patternProperties for the regulators node to allow for the
PMIC's vbus regulator to be exposed.

Reviewed-by: Karel Balej <balejk@matfyz.cz>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml b/Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml
index 92a72a99fd79..940262898353 100644
--- a/Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml
+++ b/Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml
@@ -29,7 +29,7 @@ properties:
     type: object
     additionalProperties: false
     patternProperties:
-      "^(ldo(1[0-6]|[1-9])|buck[1-5])$":
+      "^(ldo(1[0-6]|[1-9])|buck[1-5]|vbus)$":
         type: object
         $ref: /schemas/regulator/regulator.yaml#
         description: LDO or buck regulator.

-- 
2.54.0


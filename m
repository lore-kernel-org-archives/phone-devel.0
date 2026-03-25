Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53B2421EE5
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 18:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462105; cv=none; b=D3arM5DX0AmOaRW0fJOaV2YPqGrLJQj+LhCwfVOXRnNFiZMiy1is02/wzlMdUxjAdrLgyYtM/+4gJUsFa+6eapISOJ5Nn2VdsnKaiJaT9dH5ZzP8hOupRvz4Pn7X9G0fcGouFH8iGYSSCmErF8q5j1JZaymhLeLIQtx1X8aWL80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462105; c=relaxed/simple;
	bh=O5VLqveoT1MLTeYBJSBjiMtqJBUVJFLJ/CLj6h7ZMKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LW5pu/RE21+G2BB1DrA6IXnhN4OofHZuVuFucnRm/idotVB3u1YIdz1CKRGmUyIYNF0iotR6zIMJeyV7VMKtYsM8m2wDYIz+c2cVz7NxYgW0TNgaq9xSBkopjwzaft3XZBtBHxZhxs5xn+9GTVrWTo11dYOL20//yBy8fjsLrWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BowbVxWU; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BowbVxWU"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b04fc8851cso1090055ad.0
        for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 11:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462100; x=1775066900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rvofdNd3f5+/efY7L/G9vZlRMw7vdhOoBtyFgJOyhQ=;
        b=BowbVxWUsTxPoaN+CY/4SCHwbmKekGCN9oRDlaklsw8SuxO9WJB1c0981LdLlONhPe
         SwaoMB5eTZvLEuRoCMtIwBNJhETQJql2EVD1lAZjnNL/LM9wuIzxfYs2SwBJFhFyYde5
         AF0wkLrb8mZtVsrmgL4EAuEnKBVOuqc+muqxzsjEOQZ2AuCwNnr6W48hiC+JU6CSRMls
         S2uHNUGm7Kr1xi31mTt8mSxNbHxKs3Tj3Ud80pGE/1NC59RITZ+ycot0AHe/7r47fYAP
         LPz6S/9CGGb2ggzK4R5jo6YLTgj7CBrSAZeodDBD4thBFnuAWlTglg755o0YjNqYW+8q
         gsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462100; x=1775066900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+rvofdNd3f5+/efY7L/G9vZlRMw7vdhOoBtyFgJOyhQ=;
        b=Htfo65zuBSbtA5g/6RM4CMUeukuL0D3Na/69j1CzRzpMEVbCBFVEfEuX0wpoSyXuVn
         pFvWTOfrGoCYPdnw6gcIIj6ffg70vJoG7Vohwl0aeMdojUDux5+LYA+qWZmqN+56qUtZ
         vbBe5K7C6kpZcu9gcJD3v7hCBg2inEyULI+3Iza6LrdMqkiJhLW8vba1+fzgkF8slPuU
         1/8cYmd7wFiu91XLL8bqyFQ75QOzxOzLnNjNjzRSCk0PnOFYswspG/0+vdhLhV0Xa3JG
         w5uaspjlZgOqDONwR8muLUgLijGpCU0xDAUdw9BlS+JEv7rmhK3NxTkZQuZ8JnRizsfP
         3M1w==
X-Forwarded-Encrypted: i=1; AJvYcCUQoMAZJAc5r8HSSPPeLdafahY9RUrmEeW1w29uquhH+Aawnom18DkpB3a2p+XspBZr73ow+KQR8zLrmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUS4PjnGPLr/Y7ogC2jSrZJ7LOxYx3cP1XiPBkMjQRcW7gIVo7
	r+pFumvhLi/6RCZz7MWjWMK52yfV3H8ahDjMKvl6z/V9qnLHe6e8q9YX
X-Gm-Gg: ATEYQzyF1uQPYgtmhWmi8mpfQ5IIzoV+d/DPuvr60+/CRlElfRPqbPiPgrqUQSfGJZ5
	Ons0ALDUwainF+BzcvRx3r9NfMOmxjKCAGICTLy4uDWxcHE+0FjkO/qpCuPnKcpyVdnXC+wBXAo
	Sj6GrsfKKobJyFD9KQLc0ftGHok5RUDcNDTuMTEvr9LeSTsrmNon/QvRs8QYoqOMUG1ZSxfSN20
	lAxyy8xm4i8zcR+bkvpUOYTwwIt/Qm8xQUT3x8Xx2rbliGksgrXmJ/eZKCU7srV+WaERFa9taD6
	0qeJXNfC62QDFXmcF6o73mbmGWlsvQ7D52srcPuseYCd1zSHIGvRu8R7P1fdl73rbq90n2BR9uP
	J3dAoJ6mFTcmgwQV5I0q0113m61OFIBSBcLFNTTN7YKgAAe43H3oICwdmxeCmwNzUFN1WBgid26
	KOTV8wfNYHpm4WVjfz8sYvMY0Tkh63
X-Received: by 2002:a17:903:3843:b0:2b0:9a61:916 with SMTP id d9443c01a7336-2b0b0a7f831mr49090795ad.31.1774462099766;
        Wed, 25 Mar 2026 11:08:19 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:08:19 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:30 +0000
Subject: [PATCH 7/7] dt-bindings: clock: qcom, dispcc-sm6125: Add
 #reset-cells property
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-7-446c6e865ad6@gmail.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=913;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=O5VLqveoT1MLTeYBJSBjiMtqJBUVJFLJ/CLj6h7ZMKI=;
 b=rUnZtLLz4Xmj0RcCQQLRkTmldWk3RQ1b5aFfulPjR4kYbTcb4NhNVfi/aoK7g8WkEfY0jg3ZZ
 1uXUOvuzSagDL/2aA9WfaTAyKY05yLQdKb4KrPcmZQxOrgym2fPHKNZ
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

The '#reset-cells' property is permitted for the SM6125 SoC clock
controllers, but not listed as a valid property.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603150629.GYoouFwZ-lkp@intel.com/
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
index ef2b1e20443..0d467c1f30e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
@@ -45,6 +45,9 @@ properties:
   '#clock-cells':
     const: 1
 
+  '#reset-cells':
+    const: 1
+
   '#power-domain-cells':
     const: 1
 

-- 
2.53.0


Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45EE242D60
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577986; cv=none; b=cb6IgSif4oCANRqKAxb9DViSRdXv4AgQDQdi80TW84ldD/En+edNrhIie36EnWMSNsGc0DaQfH+4DF+fwdm4+niVXELjN+VzV3Yx20DI8BPJ7ACLsXVzDfjG64/A5F/iCBb6HXWao+8UlONDXTTCuMgZ5snb3/xd0NV3hsSy0x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577986; c=relaxed/simple;
	bh=wg75PCTTfribT+dtDpE+CuchrgWtQI6Hhj4cdsebLPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IqKKQvFh6ZqEUuziwhoSOOG3SwkkUcrWqR10ikVBf6H+2K5E/xb80OLx2axatZzK7GXTuSYV9owB+VY8vqBmLbb+3CyA1H4ovWeEdDzNKs8J+GigPfm03fVO0L3FgkkIqGAo1vLtjfoRh9nVGGE/oA2w6Teu8yCxpDhZII4+DFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hvkx03Bj; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hvkx03Bj"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2aeada833so410810866b.0
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 03:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745577981; x=1746182781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YQvkmgUeO17WhatmtmKq2DT076cJgIIPjxnS7/XI3Q=;
        b=hvkx03Bjcp+GR/1QVW5kChsSmAhyZ6ws6d+wXx9Uq3zStGmQrrd490lGWtJIEnjTqe
         4W7cDcwtOdIjufJe1eMvc5qF+fuWqrT7hbdA8NysDTgqi4kGxHHY3/aa4ZJZcApUpWU5
         zuV5se8o21ozDq1ThON3QpD2isMd2powPFlZ6N0dRnYZk/Cd6ps6naGcjrrkFIdrJWnk
         NoRgg8NpnsxOK0jljxgUELGwRO3RFErjDssEiJXKAj9/P86Z8Qe0bfx1XRBZPhOwQbfJ
         SuIFSlj1WqyyFV2PjGs+flnLaFdQcdZtdQswLHRtkTvovKx6R/ZhBlIHYlmUq6omAL7z
         MR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745577981; x=1746182781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YQvkmgUeO17WhatmtmKq2DT076cJgIIPjxnS7/XI3Q=;
        b=b70BUR+D7s4uknnyrY9Ptww+YA5ZJH1jiUxKQUY6Yf3YQlU3J3odmrYZ9JkDC+TE37
         UN4q2fOWUUFw7WIdzbim9Zt/saJGSea0nE0Toc84bE4EKCFCCF6L/3wpqATfkOIowWP6
         qXu/RiFdcFK0F1dR1J6Y1YpjA0zdbdDr05cXcUADEFoFQY+1rbgYTWbL5kfBAWop/B4N
         a+Q8IArGhb5OxeiTFOMXJs5P7JTpW/C1yMt86aYtFE/brUiS2z/J3LG2hlpreYnluqUp
         pThx/UJES66qG9pzzSnEWIyGA9oNzXqvIMWYku5ccfy8pJYbcBfzNkoKthrOoYMIVkcK
         E8vQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9DG00N0CFdYlyKKzZ3kIMXVu5uBHMjYwEEEurR+LnFxmEg0xXMtWgfjqGXB2isrtReAylXVGDiWZg1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoifjVIm8N862gMwmlLdC98bkmuE2p1QKwhJoSCvVOvSmQ3+UC
	hmYz8cB+uzgXhgkIc28j2CbtXOLlPjMCx6Y2bnMVtl80GNNXj7aXfGf+1vR/bsPeBF0cFS0N1K+
	I
X-Gm-Gg: ASbGncvxd5YWGdbZC1RBsEDLkHfsxDhGqCaH5KA4nE94ktoUHlHO/S7dSyi6ZTfqwCO
	6QY7PQDt7swCvZuB1PMKqZP9DP75hNjaVlAyakUDgqpbYMyBFSxYz0mF2cNMcTiz771+w+f5kVv
	gWlv2HncZ+uN/jNJqUNRt1U+quKmzAaffeLKO/I4k0+WolfDMCCuSp4M5LkJ585LprwTrp9/MZ+
	fEw5Iwqq4XL35QkwPBsP521nOeiT55TN8Ig+0JeP1oc0PUGEpONLTEd4kSKQjamd7l7LYuhrs9O
	bn43uI4tGXN1kAgBkVbH6FsZCqAC/5L9Noxiz0xD4jeYHBuNHR3u5QyYTzkO8q7ZiWyz+Tgrngx
	6Q6/BfbzjL9MXQcbwCnzgQXbFgjc5zjf0DRkpimK3JmwhOVKm6yh1JqJD
X-Google-Smtp-Source: AGHT+IFhT/3lbhxw1N/ErfoHK46Ys1jGbT7IoE15GimhHr4ref5PyGOaNXV88P9mZw1kjxSvsvjkyw==
X-Received: by 2002:a17:907:94d2:b0:ac1:ecb0:ca98 with SMTP id a640c23a62f3a-ace5a48320dmr460145566b.26.1745577981539;
        Fri, 25 Apr 2025 03:46:21 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7b98sm118765066b.66.2025.04.25.03.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 03:46:21 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 12:44:51 +0200
Subject: [PATCH 1/6] dt-bindings: usb: dwc3: Document usb-soc-be property
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp4-usb-audio-offload-v1-1-f90f571636e4@fairphone.com>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

The property usb-soc-be is used by the new SoC USB layer which is used
for USB audio offloading on Qualcomm SoCs.

Cc: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b6538246adf746fe7ccd6df936131c61444..07549dec0f74234465fa9b6ab21871762a2f5127 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -38,6 +38,10 @@ properties:
       - description: USB2/HS PHY
       - description: USB3/SS PHY
 
+  usb-soc-be:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Link to the USB SoC sound backend
+
   phys:
     minItems: 1
     maxItems: 19

-- 
2.49.0


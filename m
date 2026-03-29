Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90AC24728F
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 04:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759704; cv=none; b=A3VSrZ6DGJ7aCOf/K4C5aOx5c0S1DvDKu+Ea6MIKqFhuppXtH2oO9pcrYp3XmgkVS8P8MDq4y4tnKluKHMz1UXgJ3czl9uK2J72hBibRwUFGt26Xqy8NpFFYeKZUd6ncObvk3OsMofTMRMrI8Ubwrx3pQ4MBw4h7eKCQGh83wSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759704; c=relaxed/simple;
	bh=YGygMWdzOkWxAHIhk9m2re0gLrFP4aYPlOEPoq7qYjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7H5heSRAGMF4u+GYKFUmc3tIAnaNlglpHp5FcPs/SfcjClBiOpe9w/XGTDw8HGfkqlH2JacnN7++JHUqZl8Wv0AyPKozYxQLeQgSNNuFkb817t2Oui5eua9bj+lHY2KYTwWjvt++Ol0YqXFKeMqjA73INNjGA7blj2qdMZgeZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sq7ix4KJ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sq7ix4KJ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8299f1ca894so1636235b3a.2
        for <phone-devel@vger.kernel.org>; Sat, 28 Mar 2026 21:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759702; x=1775364502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KaL/5KIy32ApDCW/kitiQ1QT0fVd/CD5eAek3qOzYKk=;
        b=sq7ix4KJart/CWYnJhyDwYoVpDzWUjMRMO/U/nxVlFxHmlPLSI53aEhBveCE1QIEv6
         9k4lPmuXLwHiwleXnp6loWNQT/fpWkQSfTyJM3QJVjsEJswuaWjljhfx3HxqGfR7WGLM
         ViXuTEW2fXWL1C/RBV0MW1xQLFC/L+Y5pbY6JSqwZPap+nBMOYsTgafWARCWsL/cXUYS
         sMbt0KLVdl3VfXCvSGthr2BLGDxX3ytVdm+gHws50PtSjw3Hq2zWfOiSIqt89kE7uD69
         iq69nE4uvOFQTgTKPOXBu4eN5o5G6thsoqH4bWctHYStvof7q6xGPsuVWmSFR8HnKuVz
         XJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759702; x=1775364502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KaL/5KIy32ApDCW/kitiQ1QT0fVd/CD5eAek3qOzYKk=;
        b=Vt8VvSOLO29fi1hmRcSZSYIgQgPdy1vdeTAEkLvujTthQjCWvKr14lBxhoeMJa7xkF
         eygaxKZ6zbBmBjUSJLl/Tn2fg32wZzi5J2NJ3gFj61D1m7i18LPhNuAuRn5msk7vGP6B
         kDO74AlfnXOBsvK8HaDXOx81P8Ddosu9MIVXebw/zVXLwnwRagUM8U0NqwugMPXNA6Sm
         GFiPuR/v7BjU4PC5We/f0nuvR56C69sR/cVsdHBhWzK7ooa3AOZOcycgC4FwGaFrEXVf
         s7CItWG85rb1fwv5+BRgaH1DO2muagRzgzmX7yCH+LuRr3rMVxmd9XKjzNmU9FBgpHEW
         0I8g==
X-Forwarded-Encrypted: i=1; AJvYcCUJVSG9GYmKKoYiXNw93uXLLJwaHw1yA6rTVSetV8OE62lZiIywtfz6WOBj4c802VlA9XV/eQl/SQE9mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUETfhdjePYoJ8w/G8TXHaBLa7Gmg4I8REKXDlthuA6A/8zj35
	gwsbawHL/Y3F3m4F5gvC005tHY70OCL5z5IwsA7w/0oOy3rLIs15vq/u
X-Gm-Gg: ATEYQzxG3HUlyyfcR+dNGdtiH+zeNEZyJszZYvFTOcW+y983z18Aigg2ByoP7aDWRMv
	jX4NSZNVu5gYeB+zi9W7KWIDaFkqpAUDdRRC3Qzaoixa4hH3q+kT1+GZSIe18dnHEcFzobNr3G/
	j8eMLCmV4JFBNtANcD8gy9J4yokimPqHr42B6th9l1wFx0rCFpp8w9Tb4d7ru5mTp1Nh0Gwt5QD
	Dz8Bd+Itw0h1gF45u+nTMqS/qqYsEEEt8ZHuv3ibqMbUtHDAtJXn51gdg4z7UIRbI+qiNx1y/gM
	1QtmswyXnpqJTCts8fznRB42MATV1sen8mpg95hrg2s1wNl5Ejq3YfJZShC/IvnHclhyX2Phmlp
	aqP3unLSDy0QJHb3iVwK9W+wSKr5Qe0W67qORwUUxOwyE1JxMRQDV9VnZZdg3VZOkgSmpz8gqhz
	BGYsA0gbiRVhTVdPypYUgJ59Dy0bXTKxdsWB+tTx4=
X-Received: by 2002:a05:6a20:2586:b0:398:9c2b:c92c with SMTP id adf61e73a8af0-39c87958b2cmr8139178637.27.1774759702273;
        Sat, 28 Mar 2026 21:48:22 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:22 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:47:57 +0000
Subject: [PATCH v2 2/7] dt-bindings: clock: qcom, dispcc-sm6125: Add
 #reset-cells property
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-2-870e0745e55e@gmail.com>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
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
 phone-devel@vger.kernel.org, stable@vger.kernel.org, 
 Biswapriyo Nath <nathbappai@gmail.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=994;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=YGygMWdzOkWxAHIhk9m2re0gLrFP4aYPlOEPoq7qYjU=;
 b=Gerql4KQotDpznTNfzs2aU5gnMJpoN1rt7sSLUq+cuKe30nRjNFQr75AqDCx2jLHmcs9nNTXy
 2ISOqyWJi3sAHnAPmupVbSjeKV6GV/pqFOoo2Bxq8JaMIWcuY4TAgEk
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

The '#reset-cells' property is permitted for the SM6125 SoC clock
controllers, but not listed as a valid property.

Fixes: bb4d28e377cf ("arm64: dts: qcom: sm6125: Add missing MDSS core reset")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603150629.GYoouFwZ-lkp@intel.com/
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
index ef2b1e204430..0d467c1f30ed 100644
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


Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF42285041
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 04:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759733; cv=none; b=UzjaFo6cdPQ/nmAeDc7VK2IWShaOfZBKlkp41mEUXIaLvOyroTwx3Uz7BMrZthKtEof/WYQHjhG7Ao74l4zFDeVBp1xoaW/OC5XMyuSHQ9hNNbxw7Q/CAzEil6Xj6vlZffdfoA+r1cxgqoLzvS3Z8sEw4AkBwHhK3X9wKbqSm2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759733; c=relaxed/simple;
	bh=jbxDqNZvBi2gj9IFvEI90pxmvLwKV+j3EaaxzyzaJTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ts/UD/PRE9DTfCRZ1EHcSVylIlyi9YF9zsBqQvJA3OtoEfXAN9G3jlI9CkOihzdJK1vh+4WkKrEV3QfdCCPJMY9BvLLKb2QzazgmX+0DpTIZlpkIChla8gLlj2T1R7Toc8ub8xAQDbzna4cCg2jroQt7vS972VclT7IqCsclK4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdAInTUc; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdAInTUc"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35c124d2613so2272001a91.2
        for <phone-devel@vger.kernel.org>; Sat, 28 Mar 2026 21:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759730; x=1775364530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3tZXb9ZuOyelSj6Z0lI4WVX4+hZpWr55+BMQK3m+PI=;
        b=AdAInTUcsFpyZtVCb7wwDIsvK9voELpIJJzB55MboIHKr6QHRj5qjl62KWMOs3m0mJ
         HZ5ASnBqulq4Xt/l3xuMgtuUa7gol+n71M5rtEAHtup4iKVNWQ8H9xC9qYC4d0J8TfaT
         u0FZa4KRMxGt/kjech/AamV78xelsERLrinp4ylbl9iCuuN2bqGrNlVtaN2uUH64ds9G
         SzaRuZHHbdwqyPS/YGC5k5dXf7YzZHkCuYk4WNG4R3cEN7o5TYe7uoGwm9g3vCElAPKE
         EgRaewXk/zu1iv/A1p6Ab81yVe5h6t0fzqyq6oITtESyRuvAYzasXaUo+y6YoX449CFu
         AwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759730; x=1775364530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c3tZXb9ZuOyelSj6Z0lI4WVX4+hZpWr55+BMQK3m+PI=;
        b=MhAIqiCC60jYrmDZHXIUv3HkWQlZSEpOfPaVu86KRME7Z8JEMAEByXPe8wFlyNyc+T
         ALuTNTS1kgpNTt2W2OzKS5F13ccfi+VdwCuwQnuZjp6us3Qa1p6KfxdXRV3vfQUn3A9Z
         nTuudu0R3VlyrZllWnjjHsA5FrUtuthiYqnK5BElbEpwhsSrWFBwQNq0WjjrqqSa4b8e
         045QqGKxlwIVCcNW4vPNA+bFk/jllLtClRPDAfeZAPF9FcTUOpq8jFIbYF72+DrVkpUJ
         1c7WSEqiDrlBUSjAPrAaun+AcN/C17tjy8UCF8ayoUgd1Nf5n7JFV2G/4C0qUqPfX+cz
         D8+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvqM+4tuhmgPxEi8e3I5H+1RX+H3MBntDtmYn+nPKM2cHnlZbicksG3ULHEqm4tApT4THPh1U3JY5PZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMaY1ulB06azM3XSnhBvWEj+SbDirM908r+hdZla+SQ+bwfRPF
	L1Mpxt0aTE/ZSMlk2gCg5bIa2B0xXXG5mxVcGxBIUIuWxgEQo9XU8dch
X-Gm-Gg: ATEYQzw/ZoFD1/ypWKmREMwnp032oCtES9iPrkrk3sG9TE0xuO+JRm7krUkB8wF3RtW
	eleLRZVNHg5ZQocpVs81kQbgsus07iAOoNTtBjhMg0QS1RY+ILAFhN7zpeV0N3y0sy16y+WMmaI
	fESxEjF/bJuZsK0vRtVPmssAamK1O4xO6/XOailfx2LGjzumLiCuWLL/4m87wSYevNMf8vHMyMT
	Op9wExsN2CPxP09Jczmb8kLIhZnzidLNrGJN4A4el5/bOLBcBq/Ytui/swZ1MBbLKM5Lkb+YipX
	2lSOeDtf1M9gHSJxd8qwY0E3608zh2eQxoGHU3dsp2BnkMqwlJ1gLXmyPViGxUuz8yrXhMDgrui
	X+0MY3BQkM+cKqOCUa8hqtXi1IIrOpQ+zt0xNaAH5f6HXETD9FyMwHKLkxk7fMvASqlgzFqO5lJ
	kq5Ge1mNfNmlTdC9QCO/vfR8H0sWDa7oIC0rq3JcY=
X-Received: by 2002:a05:6a20:94cb:b0:39b:f026:6f7c with SMTP id adf61e73a8af0-39c87ba1d3dmr9052151637.49.1774759730149;
        Sat, 28 Mar 2026 21:48:50 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:49 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:48:01 +0000
Subject: [PATCH v2 6/7] dt-bindings: leds: irled: ir-spi-led: Add new
 duty-cycle value
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-6-870e0745e55e@gmail.com>
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
 Biswapriyo Nath <nathbappai@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=963;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=jbxDqNZvBi2gj9IFvEI90pxmvLwKV+j3EaaxzyzaJTA=;
 b=81X8217C3DPp0B0P3hZM4aXOCm8lzOtEXnsLAMxdNbbkMgYAO3fE2YKhyEY97/IFdfQWBu+QK
 SnzdsTunBnRBxxt0Ihn4/T2XiSr+rqhd+1F/PnfcK3LZuxS90GFTwgJ
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

30 duty cycle for IR transmitter is used in Xiaomi Redmi Note 8 (ginkgo).

Reviewed-by: Sean Young <sean@mess.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
index 72cadebf6e3e..0297bfbb2750 100644
--- a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
+++ b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
@@ -25,7 +25,7 @@ properties:
 
   duty-cycle:
     $ref: /schemas/types.yaml#/definitions/uint8
-    enum: [50, 60, 70, 75, 80, 90]
+    enum: [30, 50, 60, 70, 75, 80, 90]
     description:
       Percentage of one period in which the signal is active.
 

-- 
2.53.0


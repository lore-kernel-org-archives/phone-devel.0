Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596866;
	b=0clCsoALiLm+nX+1KJh+HU2mNQqKQuCjfu0a7/gbqUNks/hJcl7PL0wymQB+qppOT39p
	 7YicB7yR01VzTgIaclB+N5vrpbl7dKpdAf9HK4F2TRydNknCxDCeesTDi565yJvcF8zS4
	 bxE6/Of3ANAt38R2eb1Q4CLgiicJrHcjqUZ+CAOCgShYtKBHFtZ9+4Ok/SfqTWnFhwxOy
	 CoNvG4UFfMOAeAJHHpW0S6rdBobhxBygDPagaGF8mXnMPpBqh21CtqmsqAo2I9uoCoPeF
	 O85QeUfw/r3BfT6r3fA1nolcfTtN2lMo5O/Zos+9zCrP1s1EwoSsJh2mxGOeyPJa4qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=X0kISij2dA5dG+ZLDMffjTugHXeo/ScalkLGjjtZzlg=;
	b=uZmwkiOVnQlGWcuX/pkwRCaKRgU9nIoqca5mr/lHea4UnmqAy02jBqEgm1K5GvhNozOn
	 4HMOEiv3hVTGSMJ65mSYa0jVTMm+eTXeLCPRwn1kiitrwlcynNM3t24OI/v8gDYr8DSPD
	 PbqpwRU/EJSZMZyXkpoRLIUAGj5OiXgJJSKrcruZ2S61f3XcQGB+enNCE9f97MQojFqG/
	 IP7pIK2rBc4hE3FOZgmsHfNTT0loTA18jvCV/zkjp6ZOU1U4LKmzAmxkFCc0HhvzgPSNs
	 YcT6KLsaFiv2fhFobRAU5GVxkIRb8yMABziEY21MyA32mjZ/5gHHH1Tv8UqK4KGmzMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vm6v1RTE;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8FE606A8A5
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 19:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA8FE606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vm6v1RTE
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c468bd799ecso247793066b.1
        for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 11:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596864; x=1795201664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0kISij2dA5dG+ZLDMffjTugHXeo/ScalkLGjjtZzlg=;
        b=Vm6v1RTEA4FWJq25ASY1lb5MR5BgXMe4qoAyAKawSq9cDnRLqH/msUZtMegpu8mO31
         3alveRSeEqOlea3xa03rZSdDRmVsFWBqx0LvtXUYw2yHjLyfgd/DRtnPA2Kv33PBvdzq
         6/D04/Ychb3xeD7h2lFwdXVW9kehjlwqs6tQqZ6ir45YeFHjeC9p+tqjQCCzhCBM80Gc
         dDUSPmVKWoIld4xsa0FObxQKQoUQqEjgaxbgyLvcnnwHmjG7pd8skw7SxHTHjtYmY7Vu
         m8wlHEZ/BrlQKb0qUoRYpWhitGlL0IDd03p5YchHAQXI015wKWpYldCg/LZsRoMg6eGb
         Q1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596864; x=1795201664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0kISij2dA5dG+ZLDMffjTugHXeo/ScalkLGjjtZzlg=;
        b=XLV1SOZbhnsebH9rlvG0mxS/4difb9uQnsccIGgv5mztyS4mnHcfBVVYesmynxKg6n
         JAevXF2L2toE9rlffy+047hdZUvQLS/G15AEqBUrT8wpFTNoX7odYgr2JsunkB1GApni
         tHCrGEi9p3RKCqumxPAuY60iLu4YEyFw5JR/H5zg8QC8UmI1fJWI09p4bKhrbQoaOPjB
         uvAuhHgzouaX0Om/d/KrvLvazkaoQICE2znZe15d4iDJ8jUYzo8RPbEzqd1q3FR1dhDl
         wbV/H0VKxVpf2IzuVAxtAwEiuqxsJqQ3v1eh8cousJ/BcSeIHHkE417NeAohHtEVWPol
         xd7w==
X-Forwarded-Encrypted: i=1; AL+hErFNh8KfKKREuLrCnGtSbWidiZ36gzMYLV2OhwYE9cMo/alQvuRZLFSpnGDmRBBg4jDcfjjCgSRi4pw2Mg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+k8Q54uDNBc291QFkUrN4dF6auBvGBi4oG2EIQ2kRp4VCV0NIx
	D0Mye5j2mvqipWOc6whO5KNKr5docaTnBEqRIHbkKv3wSW+oy8BGjS60
X-Gm-Gg: AYBFou3Xwu6jjy0dWMRmc6AHakJ1eOGmj69dU4IzCPvPf7UN7USQeFRhJzt0xFYbmrE
	W9s4L8zPfuGWAvkF8BFQzU4GJ4+miUqTvXe2hLvFhrHqk0OTGSKp4TZfc79jtFFEluHpp13BV+R
	YDM1MybP9XaayIyPuvVHSmmLb2xBsX/FsQSGOR6VxamH/vDPtYGhlkV0d2LU+Nvw/um5tExSwtA
	5xzSU4As/nXHMIvAsk+pDinqoOKdObCzlXneYDOWslS/edAddpdfG6ryIAojBW2X/te2epqqKuI
	yhagv6kZCfCDXKa+P4i7uC5UhEGFTd7+NZZ+0psZ2jz6vxDkmOZv1s9M3cFgn7LMTpsH5Uq+xyn
	KuY9cu+XH7itWI0QrERyELXvYE5Gqxlk8abRU6NAwMvU02oq1szYzJWbjWhUTddvb+bg+UDsLmp
	1gQOxVBXhTsbtbjZxz4Hf15ngCQC62jLsOyTpf9iIBVYS6MYb/mLedvWS5fRRPnlOumL6+GOdM+
	cDCbfsNpJwdSz0mjOzbKAxDBN+32pSp3T1GBW0v+Z1h5uo3WjM4CD8Xj5YNsvm5XfsctICullT0
	S+hLAACNE0CtOhqa3nFLrP2ppUi/VNnnhu99nH355tm0l2re7qQ2SMYUMSGZLmI3
X-Received: by 2002:a17:907:9305:b0:c2e:4e08:19ab with SMTP id a640c23a62f3a-c50963d50e5mr310340266b.16.1794596864130;
        Fri, 13 Nov 2026 11:07:44 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:43 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:04:57 +0300
Subject: [PATCH v2 1/9] dt-bindings: arm: mediatek: Add MT6895 and Xiaomi
 Poco X4 GT
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-initial-mt6895-v2-1-4ab0aa9fa391@gmail.com>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
In-Reply-To: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add the compatible for the MediaTek MT6895 (Dimensity 8000/8100) SoC,
along with the Xiaomi xaga board based on it, which is sold as Xiaomi
Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 180e6e4948e7..28180ed0e815 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -72,6 +72,10 @@ properties:
               - archermind,mt6797-x20-dev
               - mediatek,mt6797-evb
           - const: mediatek,mt6797
+      - items:
+          - enum:
+              - xiaomi,xaga
+          - const: mediatek,mt6895
       - items:
           - enum:
               - bananapi,bpi-r64

-- 
2.56.0


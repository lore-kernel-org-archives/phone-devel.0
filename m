Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794696949;
	b=epRgKZB59s4WwTPI0M9aUZt1So+r3ceGfzgzn22dVlsqltKkfIFYE2qRExQRRarSep15
	 4fBs8CGJFhR/J6dHXo9FAwwnlNGaVz9gQV+o153Ba8paTofr2VIi/9sRazJRnLsd9YBkI
	 E5bSsMlmzNIqwSahkgH9doiV6LJYIM2Ix3RzE3G2Q8EpTZQx2YDg0wpfAHaEMr9C71va3
	 NEx+vviT++Ltl+8/tGs/0laYobuZHH6RJ+7vCDgJoHQcbjzpCHtzkMOlmRlQrFW8X2njl
	 pleb90ZwMBEB4y/sogKkKRxejsSn7nYr4nOTvr2JjOmugLt9mkUv0KnQtQgvz25sWqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794696949;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9vlfSvYfqwSc8ODI6yi7UL0SJ3h1s4wGaTk0B5VZePc=;
	b=Tnxbh4t5fnOeoNCAhd6IcfnjdNfytU57hrFPZEHkaKy+3hAtj+Wu5e6juXmPNIKOsvIl
	 JVWDhQb2p90D4tl0tKp5m4L5rtpPTM9ics/wyLXnAJYFx1IahpO4xoMP4OJhKqdwlaMsY
	 jeoQMl5dCq3kOzMUhcQdq/G4iyxTF7rS5jxypFEVVFfumWxO3j+il+dpW5Rpz4vp4XX+g
	 3w6ajHYt0LvpC0DiSuWjgV9c+Byk28+/dWV2mr4pDExGTmwftfqEiNSwyhPRBM1T2g1JS
	 tNpw0jtZgsYOujZVohD5mPtLO/5n7OB94bQbfyV+QEmoeFZ0vyqe5B3GA2z7Db03tQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=ZP+TltsF;
	arc=none smtp.remote-ip=95.215.58.99
Received: from mta1.migadu.com (out-99.mta1.migadu.com [95.215.58.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5559E606A32D
	for <phone-devel@vger.kernel.org>; Sat, 14 Nov 2026 22:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5559E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=ZP+TltsF
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RKdUJFZD9nYfhPbO5gyGhjv6SKsiWNCSZIbQ+/pFHgI=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794696946; v=1; x=1795301746;
 b=ZP+TltsFhmOodrqHpQw/GARgGoAh0y9zKiZScs6fqIrdkGgXZAmdktqbV2OF/EE3BP90m2U4
 u0dPeMDaDdjwkekY5OCKgffSUufX1cClCoCyBkkj0E7cStbAdOKgdaKlNHlvq2LGW/oGPaM7hUz
 zZnYTF5RbF5XGQXvmcvIfEMfM6xd8tgp/DVESZf1Ec0+CtHeB0Sn27JKHKNhvruurl37fEqdd7c
 qPbXU5CP27LeuN9CcaG85TyoUNOT85FVE1IKDbYxnunROcsOiRcFIEN+LLDPPsE2laFaD8TG4QQ
 S7JTe2Hhtkt8Sc8ugNBKrLxgz9f54VHpWdXnIezTigRcg==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e2131ee82858e725;
	Sat, 14 Nov 2026 22:55:45 +0000
X-Mizu-Trace-ID: e2131ee82858e725
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sat, 14 Nov 2026 15:55:14 -0700
Subject: [PATCH v7 1/4] dt-bindings: leds: aw2013: Add awinic,aw2027
 compatible
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
Message-Id: <20261114-aw2013-aw20xx-rename-v7-1-ea5a3113a479@postmarketos.org>
References: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
In-Reply-To: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794696929; l=1313;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=RKdUJFZD9nYfhPbO5gyGhjv6SKsiWNCSZIbQ+/pFHgI=;
 b=HcZAzW+34QUpywu8m6ruxphJZTEwPT33NSZWrLVRtmQIXeW9VsLTEFV7GcdQMZssoDIJYuBCv
 qhfydauzKyNB6g+Klut9DvVV1bPxYllRnJ/1X/xrtmy9f7UltPvX9jN
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

The aw2027 is largely the same as the aw2013, with the
exception of the way the max current is written to registers.
This exception makes it different enough to not work without
driver modifications, but similar enough to fall under the
umbrella of the same driver.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 Documentation/devicetree/bindings/leds/leds-aw2013.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
index 26238446f2bd..1ad165cfe34a 100644
--- a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/leds/leds-aw2013.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: AWINIC AW2013 3-channel LED Driver
+title: AWINIC AW2013/AW2027 3-channel LED Driver
 
 maintainers:
   - Nikita Travkin <nikitos.tr@gmail.com>
@@ -15,7 +15,9 @@ description: |
 
 properties:
   compatible:
-    const: awinic,aw2013
+    enum:
+      - awinic,aw2013
+      - awinic,aw2027
 
   reg:
     maxItems: 1

-- 
2.56.1


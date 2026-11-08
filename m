Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174580;
	b=W2iCXfeR1BCd5iW2wEZ9RCwNtERMcEOAOrTlzIKlTjjdP+2mzuJaD/CKVEE0WPajF37P
	 QHeL3sZaRlhNWD3b89mgX/ad7bi3VF+dKZEgX6uRyylJvQ5vT3y4eNZHJMV097ZOLr2kU
	 yr/up4Ht3PmoEPNEva/kfw8xxxize6/3/JvA7qXaQfhlCED0Ab4YHrs6imFVukMRJuw4+
	 jmLI7p+U3Li8dlCP28G6wYKZnkMiqAWFeemhneDVjKK/27jwE7dqKEiFFcq94MtoM07Ck
	 PkX+GcZqh8qFFCGKRFfpcueABs8j/fs+R03yTiB+UM7JKy0M63XTIcBzqpGZUjOJ0fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174580;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=3gRAP1YxlQCWGPap37hqUthvPeiuImlF2tdnQbsDgtg=;
	b=ZFMd+HNHTjNnXDYQb/SuqrYqGLk1K5EMe/iKT931gJAFz+bmyZtwxKAqunNldp5DOjAr
	 yXKlzF+I3cd9zojQiprNb1rv8VmfZdjUKqJgSjE/Gk5y/zGLDauo8QJv+cIDJTcxm0psg
	 Tc9NYUTtnIDr2J0Dr0FHCM0D3+oltf7ZG76Sc2pzgEAc/+UUs8WNQtOe2SHAXxpeXJChO
	 3JnnsEpMy6wM8pcs+Cg/8F1muy1Tz8Exl8xlQxuCSDCC2wKTfikKIzLbA/4gUScob5jXf
	 57tpPAUsWG9nIcRelTPGemn6YEutxyE8+VUNgqWTdML75MFXNaq1DpOLh87IqTlCe1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=DPmEstMt;
	arc=none smtp.remote-ip=91.218.175.118
Received: from mta0.migadu.com (out-118.mta0.migadu.com [91.218.175.118])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB20F606A334
	for <phone-devel@vger.kernel.org>; Sun,  8 Nov 2026 21:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB20F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=DPmEstMt
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=w/6qEc2cwOI6T/xUHNJh3OifoyGO3FRpW1FATx28UoM=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794174577; v=1; x=1794779377;
 b=DPmEstMtjRJP75XGK0jU3H99b/kwySRpXknVFtHp0iwYU1/ABZ8uFcX514b/8cPt3sbvcmjr
 9KXWN7+ImblWVjXeAocUzJDgXApCjvsQVna4S3QT+VgyEk4J9pHMOeK4bBjEAmx5Xb4Sz25HWzu
 TszyeNrVFw2tf3w9MIgnpzaIK2y69AvywMhXQ1u04p1hZYfTxFrKywoehlggBMWLBR6llbwbyM2
 PuvSofRBvazxzZObKx1Eio1AH+kYw0tVt9grKv2Dma1FhYyIGE1OJujNOnGAVV7tRiTqGgmW9Xc
 okbkwOWz2YIIvwn76oNOB3inT2J+ZJiRMBh/CINjaOz3Q==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7783f211d67b9856;
	Sun, 08 Nov 2026 21:49:37 +0000
X-Mizu-Trace-ID: 7783f211d67b9856
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 08 Nov 2026 14:49:12 -0700
Subject: [PATCH v4 1/4] dt-bindings: leds: aw2013: Add awinic,aw2027
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
Message-Id: <20261108-aw2013-aw20xx-rename-v4-1-826529beeb52@postmarketos.org>
References: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
In-Reply-To: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794174570; l=1313;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=w/6qEc2cwOI6T/xUHNJh3OifoyGO3FRpW1FATx28UoM=;
 b=vzfsl081FbFIiyzZnvCW2wCOy36hSI8+MO79cCOflVhL6CE5/pRgzXh4IO3i1Y+5/fQzRJZNi
 QJ7aOlLaHCJCDAcNdRM+kj/0an2Ikp5AFWwAbhSEQqb7PcSt/S+wyTS
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
2.56.0


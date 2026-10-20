Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484829;
	b=RNqBODrntnekkLdBLy9mwfvzZRC9HYK8Okr3e0lLTfJk+FmxLXQW3hkekvG5tOE+d4mf
	 tcZiowsfNT7MS5MwMBYnfy6bn4j6nUN5ybhcrXNd0mE8O8mOnVRp1v5Tm5HTznFf6Z2A2
	 cr0ZMN+zpLksHkFhJ6PEFZXGeVN+RByLA7SBirZfXGOi02wefb02FxkLUu4UJAwcYHt+S
	 V7FBYU739rMB55E5tU9SjZaCp2ZD6nL43BT4pMrll2rFpV0BDn/z7F/Joah9mviRd2B7X
	 /dlicnR3Z/XUAeltwwcvB31X4bUm2bYsLqJmod1ptiBfNJ1tFznRywuEosxZcCd9/0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484829;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8sR+zDzMi9HFrsdnqSgy6DAeaNbWllNx84H/JCpIZzw=;
	b=YneHPbP3aV4WzkabZIFBJxP8Y1SI3pW24j7+p29f4eAQ/R7zQBrCrt+PEpAKGn0xf3BN
	 pYGCHIz/MsXZVmRHbPHqga2IxuDHVmiX+FcoQTVuHBMg9TLDXd3qGssyXvWw1bsL+cM3c
	 dKyi62QdbBVpz7a3kbLAeFGJZoUSpFo9ClGdLBRSgYA8bS+Qkg6V2zMur1vSB7nRPZWji
	 Oo3VEPtGr/OX4JhsGsIh3/ja/Ay2Tct6kQjzDF52ABFWuNrUFTs+KAjDaRZmuole9Ht2c
	 ys+JUAgicu2CM64nKyWfldvRXL/zRZl/QkBjMQt/0OmEjkyJesWMsAW8ojVk8ol8kKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=QWpJ1hCz;
	arc=none smtp.remote-ip=91.218.175.81
Received: from mta0.migadu.com (out-81.mta0.migadu.com [91.218.175.81])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8745960A260B
	for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 08:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8745960A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=QWpJ1hCz
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=h7y1OEuGysqMDVk0RdcCkB7ieMe6BbeWyLj9fbcPZIY=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792484826; v=1; x=1793089626;
 b=QWpJ1hCz7DVxdh8eI/vxGzMvZGTajusM36BhYONyWJn7DzX4PeNVzJhhbr263ZIUVEgQzzZg
 oIMhh4GeXy5g6sDqP5pPQmk7C4z9/doOLWiu9TCfOtabh3gnCQTpUxKucqjX1CfuyZhHbFJo49O
 T40/NmT7g01aqQuJzz+0ppi0i0/KlEBjkiSXpASQlEkDZ+jB8fkdaPej+YAbpgjnLHRYBClXXdk
 fai8+9knPGeA9uSEsk/7tdr/j71kTMgIBfefGy2ZgVq4acGRAuLEm2JE6LvgchdhOuddS/wV6+n
 dLB3M4H6M7ai/5m5S9jxTrxxMA9xcV1q1pMxg90tewfzQ==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 55b6189bc852d6b9;
	Tue, 20 Oct 2026 08:27:06 +0000
X-Mizu-Trace-ID: 55b6189bc852d6b9
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/4] ASoC: dt-bindings: qcom,wcd937x: Add USB-C graph properties
Date: Tue, 20 Oct 2026 05:26:23 -0300
Message-ID: <20261020082631.1509275-2-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020082631.1509275-1-val@packett.cool>
References: <20261020082631.1509275-1-val@packett.cool>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This codec can be used with a USB-C SBU mux to support analog headphone
adapters. Describe the mode-switch, orientation-switch and port
properties similarly to wcd939x.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---
 .../devicetree/bindings/sound/qcom,wcd937x.yaml   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
index f94203798f24..f15b9a9d90b1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
@@ -25,6 +25,21 @@ properties:
           - const: qcom,wcd9375-codec
           - const: qcom,wcd9370-codec
 
+  mode-switch:
+    description: Flag the port as possible handler of altmode switching
+    type: boolean
+
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node to link the WCD937x Codec node to an external USB-C MUX IC for
+      handling altmode muxing and orientation switching to detect and enable
+      Audio Accessory Mode.
+
   vdd-px-supply:
     description: A reference to the 1.8V I/O supply
 
-- 
2.55.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F7F2222C0;
	Sun, 11 Jan 2026 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768126256; cv=none; b=QKD6fnTKxoSxaKnZzVrYjtxED1QavzpttfZ03DuCn30WZMkjN6Pt50QuV1RZgswyICs89vojFxT0mcobB4Ik11SfLlwjqXTcl5B3bglfjXxjavn8BCLtcym4xy/yHYAgBLhGwaNRuZPZ2+OIqBVOUNu51akbZW2D5kti1CVSnPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768126256; c=relaxed/simple;
	bh=FWQFie0C5TUWkd6++TyGqpPBE1fsNzNE+KYxlBibVTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=arbwNNI9gbqobP6hwWQISiYFagoB4TZQmf+MwXtOccktkQMWUqsZJYoVTRXmXXg6C86xMX0c5CoDl/OFiyi2aUOHWecNppyJRuJJmdbZPprBDDeh3Wc2TLWngBQvXo8fxqEEYiznPpBQyGRVttBXEdfHtdNWo+U/oRszOcoGE4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2VlHBvN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2VlHBvN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67533C19422;
	Sun, 11 Jan 2026 10:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768126256;
	bh=FWQFie0C5TUWkd6++TyGqpPBE1fsNzNE+KYxlBibVTY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=a2VlHBvNFYioTXqfXmFn17j7Dw4Otz1Akg4cX4QKsFWi9d+WHn+x/seJ+VNbK/PxE
	 e4ogvesFTT6c5iNLIbuMPkJmrtGfffkvaynwgVPzbSc/K6rPEqiQ/ncdRdFPiRlblu
	 qkygYW6DXWHWyVTMrStN3Vl9zllc9E4QWwfuvbNNGfauoZOBW9jKrl0mj6DxHKDwvM
	 RyKgmZyyUkfumgzJsUeYodMf/tT7zAFFcLJ9DycLyeB2+NMmxfbFOXM5ctXlyuYE7l
	 6igtly/3WieQagKiCmRsUUxF/Z4liurhVYpQbZe9gJpgbnEsw+xj+X//Opok4AJ3Nt
	 N5vLu/Uq9UfKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603CAD2502F;
	Sun, 11 Jan 2026 10:10:56 +0000 (UTC)
From: Bharadwaj Raju via B4 Relay <devnull+bharadwaj.raju.machinesoul.in@kernel.org>
Date: Sun, 11 Jan 2026 15:40:31 +0530
Subject: [PATCH 2/2] ASoC: dt-bindings: document dvdd-supply property for
 awinic,aw88261
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-aw88261-dvdd-v1-2-83fa0850d561@machinesoul.in>
References: <20260111-aw88261-dvdd-v1-0-83fa0850d561@machinesoul.in>
In-Reply-To: <20260111-aw88261-dvdd-v1-0-83fa0850d561@machinesoul.in>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Weidong Wang <wangweidong.a@awinic.com>
Cc: Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768126255; l=1176;
 i=bharadwaj.raju@machinesoul.in; s=20260111; h=from:subject:message-id;
 bh=RDAmH+QMhrAVsDQ6mEVR7s+ZXNuEnNjhhycIkqn6Zyc=;
 b=6pKN71ol0pXW85NY7Z+0I7+rJ1buDQnXJXFuJgUKAv2GtFYc8dat5gxFKhN113JH5JQhqeX3W
 5m6GrzLOeB5B4Dvd4WYLplAGs2kVyivOjvgRz7q5nv7WzCDeZ+L6Jwo
X-Developer-Key: i=bharadwaj.raju@machinesoul.in; a=ed25519;
 pk=0M1a+iMXDqasbx7bQL71NdtuutFXu+lVxsiSnEiyAIg=
X-Endpoint-Received: by B4 Relay for bharadwaj.raju@machinesoul.in/20260111
 with auth_id=598
X-Original-From: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Reply-To: bharadwaj.raju@machinesoul.in

From: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>

Add (and require) the dvdd-supply property for awinic,aw88261 in
the awinic,aw88395.yaml binding.

Signed-off-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
---
 Documentation/devicetree/bindings/sound/awinic,aw88395.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
index bb92d6ca3144..994d68c074a9 100644
--- a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
+++ b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
@@ -33,6 +33,8 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  dvdd-supply: true
+
   awinic,audio-channel:
     description:
       It is used to distinguish multiple PA devices, so that different
@@ -65,6 +67,17 @@ allOf:
     then:
       properties:
         reset-gpios: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: awinic,aw88261
+    then:
+      required:
+        - dvdd-supply
+    else:
+      properties:
+        dvdd-supply: false
 
 unevaluatedProperties: false
 

-- 
2.43.0



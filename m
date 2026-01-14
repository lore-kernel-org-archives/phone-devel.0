Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D47D3921F4;
	Wed, 14 Jan 2026 10:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386807; cv=none; b=RJBzDYBZH49FvioDfzyhRkuPm7Ja8ZTus6FT2HjfPAH3e+42eVNdRTwhr4h66EGz2GU2Xsla0Lr1PogOIKz+KgFOtFnBjIYLnvTG/UVrdUkththZGDjdwK1JdFQTcWFuucyG2cXC3KVTWDcwfbdd05NRM1F5xnQFxoByVFtk4DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386807; c=relaxed/simple;
	bh=N1BdKy4sBKxvIIyVtsyzDq2V8jFFwsJOFrPu6Lzc2tg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XnwVx7CnzHvH3gz5RhvrpjZsvj9RsTWHpB2Bcs6ZsWNDkJgIeYWFkJ+scPkw+PqI5i576uEl9dC5xfsHIvctzZdA52YoAxaHcvBI2XS59FotD6lbGp+rEJ95DFt/VQUV7Lgf0UbmJGNfDw6gNueRj3yLphAVFHQWRoBI/NqeEQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBrkSDW6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBrkSDW6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F85CC16AAE;
	Wed, 14 Jan 2026 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768386806;
	bh=N1BdKy4sBKxvIIyVtsyzDq2V8jFFwsJOFrPu6Lzc2tg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dBrkSDW63df4ofNC4rmOdXPywp4yrcQkcU2ncSYV06QJRkXhENHg8ZrKOccHWhIBY
	 0/RPRwDvXn5vekyjuDeDWcBcdZkXkCnEVl1oo6HoNhD6iUADRYabGIHJovW27mnLAB
	 VORTQdOp9ieRDqf3WPGch+ozO1CE893riJ4pWlSVvN5i5+7cj0dKRDO3tgJJJ9MkJP
	 a4O86dV90l8G6ZuOJUzK4vXREbTGrQpW0ezVIEqWKiTFgVDa7wdzDqMafSZceOOouL
	 XFyCOybX4GbtLp5L3U9VC6kCsBm4AZlo1/YG1fgq1uNRhM66wnR/s6GXgjYlfr9XMI
	 6SpSoG3uCrMhA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F45FD29FE6;
	Wed, 14 Jan 2026 10:33:26 +0000 (UTC)
From: Bharadwaj Raju via B4 Relay <devnull+bharadwaj.raju.machinesoul.in@kernel.org>
Date: Wed, 14 Jan 2026 16:03:24 +0530
Subject: [PATCH v2 1/2] ASoC: dt-bindings: document dvdd-supply property
 for awinic,aw88261
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-aw88261-dvdd-v2-1-ef485b82a7a7@machinesoul.in>
References: <20260114-aw88261-dvdd-v2-0-ef485b82a7a7@machinesoul.in>
In-Reply-To: <20260114-aw88261-dvdd-v2-0-ef485b82a7a7@machinesoul.in>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Weidong Wang <wangweidong.a@awinic.com>
Cc: Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768386804; l=1347;
 i=bharadwaj.raju@machinesoul.in; s=20260111; h=from:subject:message-id;
 bh=ytR+KVyf/ePc8ymcKGXV0QZMqpvAJw8hDP+6Qezgv+4=;
 b=FzKAImxPg3NqbTQ0C4Kf35xzU8OrTOeaM3al7ov8KZQXNIk/mrJOsAcYDPDrCzgvHYR05paM5
 GJwlIPfjo1SD3LJ8W4IM94SqXch/LjSVTc5UzzWumexHz8JEiK9ZUxj
X-Developer-Key: i=bharadwaj.raju@machinesoul.in; a=ed25519;
 pk=0M1a+iMXDqasbx7bQL71NdtuutFXu+lVxsiSnEiyAIg=
X-Endpoint-Received: by B4 Relay for bharadwaj.raju@machinesoul.in/20260111
 with auth_id=598
X-Original-From: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Reply-To: bharadwaj.raju@machinesoul.in

From: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>

Add (and require) the dvdd-supply property for awinic,aw88261 in
the awinic,aw88395.yaml binding.

The chip needs DVDD to power on, and currently there are no users of
this compatible in the kernel device trees, so we should be fine to
change the ABI in this case.

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



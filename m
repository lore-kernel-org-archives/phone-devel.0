Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3067330D34;
	Sun, 11 Jan 2026 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768126256; cv=none; b=raVVU92mYx9iL33nkNXhSxnM8wFlD/3BcQy2M65Yxe8QOzIn7AP9kvnG5K4j3awBRL2faMaGe+3wgTs4gKlyvHsePDLMvCH4VM9ZcgKdQmB6wxfMZPqyeDzkSRqAzttYL4sAoORAo2ARh56YybcRP9rpFLLkr8JGAhP8NEq3/9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768126256; c=relaxed/simple;
	bh=zV/ctewfiPYQ3WgFlicNsePqY0KYzA9iBBwBOFgllA0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fs4+w6Uugx847zJ/dfdIegZ/cjw44rnqUelDwPGlvzmSvb3U/F7fN1re4QG8Zh8Amehx/CuNZuxehExJ+7RdVzAWrjruC1aeEZfbM9IcManxLbtr3VmPauc4D/05whEQ+H7fywde2o1X0JlK71Dx4s6N4ghJgBL6xv6pPPYlx5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RfbBiXxy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RfbBiXxy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C2B0C4CEF7;
	Sun, 11 Jan 2026 10:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768126256;
	bh=zV/ctewfiPYQ3WgFlicNsePqY0KYzA9iBBwBOFgllA0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=RfbBiXxy3Wrb49OTy3QSW0X3iYnPEUoanZ3ZOJut+ao6soJYBqOs3QPRrLSjlKbDW
	 YEoDLv2P+yZNZuzIgEott6YqgXGRk06JJQOvSwkAdwPKIW7PGmsEYIdSGew6nOqyii
	 vm9VB9OvNGVchnll1W31WE1QlOzHtpD6Kllqot8yD9i0X/UeKYUEgPHPEgvxkylGKl
	 t8M/V/3QKRy02sqB/GfueaGfen06gbRewWmqL2Uo7CwrOLyYYj9RNMuOnpgWb5I34y
	 OQos9p1BzNBZIdZK7u0t7m358DhnuC/Osk6P+lopRrNkJ2B7faQNWHGu+EOPrz+7yT
	 WE1zwb+g4xu3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429C8D25030;
	Sun, 11 Jan 2026 10:10:56 +0000 (UTC)
From: Bharadwaj Raju via B4 Relay <devnull+bharadwaj.raju.machinesoul.in@kernel.org>
Subject: [PATCH 0/2] ASoC: codecs: aw88261: add dvdd-supply property
Date: Sun, 11 Jan 2026 15:40:29 +0530
Message-Id: <20260111-aw88261-dvdd-v1-0-83fa0850d561@machinesoul.in>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABZ3Y2kC/x3MQQqAIBBA0avIrBMcSZGuEi1Mp5qNhYIF0t2Tl
 m/xf4NCmanAJBpkqlz4TB04CAiHTztJjt2glbYKEaW/ndMWZawxSqPCiAENrl5BT65MGz//bl7
 e9wOaJ6zHXgAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768126255; l=732;
 i=bharadwaj.raju@machinesoul.in; s=20260111; h=from:subject:message-id;
 bh=zV/ctewfiPYQ3WgFlicNsePqY0KYzA9iBBwBOFgllA0=;
 b=BlsJq7CwBNYETg1lA3PeqFyXeE9jGEu7zr0hww5nZDeDOXZQhXjwfXR3UaJ8wLUbnbouHWxgB
 HkhYLeKb8M7BoiBRmwiL5iITfLACHtVCtWtG1B2qnRY1q9ozCiJ2bXp
X-Developer-Key: i=bharadwaj.raju@machinesoul.in; a=ed25519;
 pk=0M1a+iMXDqasbx7bQL71NdtuutFXu+lVxsiSnEiyAIg=
X-Endpoint-Received: by B4 Relay for bharadwaj.raju@machinesoul.in/20260111
 with auth_id=598
X-Original-From: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Reply-To: bharadwaj.raju@machinesoul.in

Make the aw88261 driver depend on and enable the dvdd-supply regulator,
so that the correct regulator can be specified in the device tree.

Signed-off-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
---
Bharadwaj Raju (2):
      ASoC: codecs: aw88261: use dvdd-supply regulator
      ASoC: dt-bindings: document dvdd-supply property for awinic,aw88261

 Documentation/devicetree/bindings/sound/awinic,aw88395.yaml | 13 +++++++++++++
 sound/soc/codecs/aw88261.c                                  |  5 +++++
 2 files changed, 18 insertions(+)
---
base-commit: db1c30e19243982e34f027a2e564c93e94f42cb2
change-id: 20260111-aw88261-dvdd-50c41c151ba0

Best regards,
-- 
Bharadwaj Raju <bharadwaj.raju@machinesoul.in>



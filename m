Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3D53921C0;
	Wed, 14 Jan 2026 10:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386807; cv=none; b=T+oPQhJXSvgR8OpxOqTdri5KvV378CiBSMtfuey/LIeFxCflKi5NEOm3h0veGNF/XB8W1nkDwr7cW03VV81vD8TIqECpo1SRB9swrmQ9mgJCFDMwvxZDB/eY8EZ7BFtMp/anA73xcOYIhj7vAngFmLwxUDUR+v7XSix5TN38vrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386807; c=relaxed/simple;
	bh=EZvwB5xw50grkJYmYSe3ftlsXRapgsRBC0XIhXklg7s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NpHCR+uH7WK3R4LMCywvMGpBp40aqSs5J2Fezi9H7ihMzrefeMCjkyiPCXA4bNwD2F6BwG6msEFWXCw4vIxxINv+vGeZ64Coa1WP7ES9GPKRwfuM6pnPa32L+UPqSX7ewYSTfwHXqavpCxDfdUzmr3nwlCghA6q2vCXlI5Fp7Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/c+cDQB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/c+cDQB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30BA3C4CEF7;
	Wed, 14 Jan 2026 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768386806;
	bh=EZvwB5xw50grkJYmYSe3ftlsXRapgsRBC0XIhXklg7s=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=D/c+cDQBs0+J6lfSYb3uHq/LNeb2+Mgp5UVMAtVPK4iiqRE10IzVYjTSQfWNMvbnW
	 EGTz8gnpYntfT0t8T0ycNJh6clHfRy92V+p4tOAbdUzuuuWE6W6xX0sNvLM3S/phJv
	 X2xiM9fkvR/JPd403BUfwGzRxyFY3BkQwKEA1ZEgYhFCw412Yw2Kdg7XxtSSViW4tK
	 01ghCSvMyNSgy6HAUfwjm2l65YH/du2g1ABS1ByJAit7BN888H43/2eCNph5g6kLHV
	 5C2e+31M+XjOatpyRZP56yHlB61u0gMYGAaBmsOTCe2v78MMWwrL0Fe1eE4ZJPOwyB
	 TButNnTc39AAw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAD9D29FE7;
	Wed, 14 Jan 2026 10:33:26 +0000 (UTC)
From: Bharadwaj Raju via B4 Relay <devnull+bharadwaj.raju.machinesoul.in@kernel.org>
Subject: [PATCH v2 0/2] ASoC: codecs: aw88261: add dvdd-supply property
Date: Wed, 14 Jan 2026 16:03:23 +0530
Message-Id: <20260114-aw88261-dvdd-v2-0-ef485b82a7a7@machinesoul.in>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMQQ7CIBCF4as0sxYzg0KIK+9hukCgMolSA4qah
 ruL3bv8X/K+BUrIHAochgVyqFx4Tj3kZgAXbboEwb43SJQaiUjYlzFSk/DVe6HQ7cmRorNF6Jd
 7DhO/V+409o5cHnP+rHql3/oHqiRQmN1k0Sj0StPxZl3kFMr8vG45wdha+wJAH0KgrQAAAA==
X-Change-ID: 20260111-aw88261-dvdd-50c41c151ba0
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768386804; l=1091;
 i=bharadwaj.raju@machinesoul.in; s=20260111; h=from:subject:message-id;
 bh=EZvwB5xw50grkJYmYSe3ftlsXRapgsRBC0XIhXklg7s=;
 b=dctiuFwMwQeOuQtE+M4tVuEm8ZhDLG09fILkQ25KfKPtApWh78uS5cujBhwx+MZPCYE1LH/Fh
 Uu/V3Qm+9Q4DQeKeRQzzHD5Yu5djgvrF0PZRj3465embPdYDbKhJ87E
X-Developer-Key: i=bharadwaj.raju@machinesoul.in; a=ed25519;
 pk=0M1a+iMXDqasbx7bQL71NdtuutFXu+lVxsiSnEiyAIg=
X-Endpoint-Received: by B4 Relay for bharadwaj.raju@machinesoul.in/20260111
 with auth_id=598
X-Original-From: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Reply-To: bharadwaj.raju@machinesoul.in

The AW88261 has a DVDD chip which needs to be powered on for it to 
function correctly. The property for this was missing, so this patchset 
adds the dvdd-supply property which enables a regulator to be bound 
to it in a device tree.

Signed-off-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
---
Changes in v2:
- reorder so that the dt-bindings change is before the implementation
- describe the reasons for the new required property in the commit msg
- Link to v1: https://lore.kernel.org/r/20260111-aw88261-dvdd-v1-0-83fa0850d561@machinesoul.in

---
Bharadwaj Raju (2):
      ASoC: dt-bindings: document dvdd-supply property for awinic,aw88261
      ASoC: codecs: aw88261: use dvdd-supply regulator

 Documentation/devicetree/bindings/sound/awinic,aw88395.yaml | 13 +++++++++++++
 sound/soc/codecs/aw88261.c                                  |  5 +++++
 2 files changed, 18 insertions(+)
---
base-commit: db1c30e19243982e34f027a2e564c93e94f42cb2
change-id: 20260111-aw88261-dvdd-50c41c151ba0

Best regards,
-- 
Bharadwaj Raju <bharadwaj.raju@machinesoul.in>



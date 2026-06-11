Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ECB1A0BD0;
	Thu, 11 Jun 2026 06:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781158090; cv=none; b=eRvjp7FnGNoXz+7DqB17GAJ0KtQJaaQ7W6lrbPm86kE+RC0Ui39SFLqE5vGVso/+yW4u62jJ2teGTbx0XjxD4OAPX5th18StXb3O1nZw6ZpUAWAVXPOp4KV749GnvasvTiGW11ELUcoW1SGPWYovoFQylSD50eWyDnirkQO9k5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781158090; c=relaxed/simple;
	bh=81muFtNZlIN5I+ReHetL0p5x3A+MyYaxxxEAsQdgsiE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QnMvx/1v6BoTiucI3c3GhrxfOqUDtx+IHQGPOLmEtIucDq/Pv2CqENp7GBej57EpbdA3tn2Q+e8JwbLrtB+kmsNrvGGVLnkO81BhiQI0CPvKarRJDtl8aFopvzE1UfUZdXiYgh4vSM8y09njAscEUMKpqGAUDCue5JymaKEUCrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Teqyt6jL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Teqyt6jL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DF03C2BCB0;
	Thu, 11 Jun 2026 06:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781158089;
	bh=81muFtNZlIN5I+ReHetL0p5x3A+MyYaxxxEAsQdgsiE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Teqyt6jL6hijIep64ZxmyiUlIwfknzaHLfZDm8o1qRRsMOKvkKktH/8LEo837k7KR
	 m6eAh2FJXBtYjN+/Cn51/WVuB1H5UiCwlip6GfY7Njrobw9ocOcUeOU0nplf3vhrGt
	 CBjHapY3N8bM5hQkgRVGcoPXKUTeXMFNSGodV8qFdm7/WwOZf6V4atkbC88OD34o0w
	 VTKeMOoG8ukZnilDp8a8d8oj2+Rt/bmMcqd0bJ6zh8y60pJ+5RjNc5QCsiAV37rljc
	 wmuEkb/eNu4srVzL6FQP4O58/jw6Xf9eabsOVm/a6OfNn5tKxrR+7+GKA9MyI/5X3N
	 IuQuOrKJAHCGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931C5CD8CB9;
	Thu, 11 Jun 2026 06:08:09 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Subject: [PATCH 0/2] drm/msm/mdp4: fix intermittent blue screen on Galaxy
 S4
Date: Thu, 11 Jun 2026 08:07:45 +0200
Message-Id: <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-0-22925600e4f2@alex-min.fr>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALFQKmoC/yXNwQ6CMBCE4Vche3aTFqQkvorxUNoR18BKWiAmh
 He36vE7zD87ZSRBpku1U8ImWV5aYE8VhYfXASyxmGpTO+Os4cmLjqLgu7x5ivOZ+3EF55AA5Qy
 NogNvlo1ruth5F5q2pZKbE8rkd3W9/Z3X/omwfPt0HB/C2qJDjAAAAA==
X-Change-ID: 20260610-mainline-fix-mdp4-blue-screen-sending-v1-0637d7a6c355
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexandre MINETTE <contact@alex-min.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781158087; l=1297;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=81muFtNZlIN5I+ReHetL0p5x3A+MyYaxxxEAsQdgsiE=;
 b=0xbJVqU4awXIOs3QAV1exSkY/TNPZmxrn4rSiwfmmxX3PgynjiiF2s3u7oOvRNUQsQoI3dQBY
 GNcWij60CaXBzgqdahAot4Dc5UraLukFX185Itt9H67s6HDMhZDVZEp
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr

This series fixes an intermittent blue screen seen on the Samsung
Galaxy S4 with the MDP4 display controller. The issue happens on roughly
half of boots.

The first patch keeps the AXI/bus clock enabled while a CRTC is active,
so scanout does not lose bus access while the display pipeline is still
running.

The second patch handles the case where firmware left the display
pipeline enabled before Linux takes over. In that case, the required
display clocks are kept enabled until the first DRM modeset, where the
driver takes ownership of the pipeline.

Tested on a Samsung Galaxy S4 GT-I9505, codename jflte.

Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
Alexandre MINETTE (2):
      drm/msm/mdp4: keep the bus clock enabled while a CRTC is active
      drm/msm/mdp4: keep inherited display clocks enabled until modeset

 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |   3 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  | 108 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h  |   8 +++
 3 files changed, 118 insertions(+), 1 deletion(-)
---
base-commit: acb7500801e98639f6d8c2d796ed9f64cba83d3a
change-id: 20260610-mainline-fix-mdp4-blue-screen-sending-v1-0637d7a6c355

Best regards,
--  
Alexandre MINETTE <contact@alex-min.fr>



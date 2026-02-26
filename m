Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E933F32AAB6;
	Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772107059; cv=none; b=L6B4l3LDDJDVDV+m4aLcwxeJUAgAX7EpD9a3xy0JmVm1eMbctn1l4I6l2dhv+lDunP1ZGsRBmcf7grBarkrHkYjr9HmhgcuB2JSfpcixi9JKnMPYkqOraUp/ow9ZrNBSv4Xr6Ad1ZYo25gy+4Bpi1e89wYnbQf8gnxJ1xrDpp5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772107059; c=relaxed/simple;
	bh=ylQzySUo9bDhSqmkcXiDS7XuuRz2rDXvl6KfxBGmTsY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mUjtL5lv9Emr31C46hLLaNtvYB4sWBSVzEAS/KWFWozsikZZ/X656rjQExqymHfmgYIbcsLMIuP7HQVhZVxKVEKl/5HZsfBVwKw7oAAaB5NI5NKq0OH9Ndf/HW78SeIJZm2IXpYrMDpBNlnhMepr7hkISvcHAkP05poQxZ8hTbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/71ERMT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/71ERMT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 919A8C116C6;
	Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772107058;
	bh=ylQzySUo9bDhSqmkcXiDS7XuuRz2rDXvl6KfxBGmTsY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=M/71ERMTpIqfJfoO03E+38TRt0SLKF77gb5R2fC2MCD0W8nhWNO018s3Cnqsk/4s/
	 jxMEPqrBWaFZt9+97zM4l9Uvjfz3TgraF5kDcNghNmnAT928s+c2SZIj5kBAUdkT2k
	 NtEm72D3EavPZ4Q32rzhMC+o+QUPHMTKDwHKTQhpa8bYzOdQCfzNW5IDSHWvC4iA/8
	 hQyrDBFTauIaxQDqUSWr6pC0WHrQ240j/TL53uyimLT7DT+CmDM6Rsdj/2ZA9cBwvj
	 ycgc7cNKg8YeaCxdToSGkzBFzkiFim+fwZkaPgdyzrSnOwy0nSH+SsH/wAyiYT59cK
	 gZqumJveUWcVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A5AFC5915;
	Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/4] drm/panel: Small Kconfig cleanup
Date: Thu, 26 Feb 2026 12:57:35 +0100
Message-Id: <20260226-panel-clean-up-kconfig-dep-v1-0-bb28a2355b4c@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC81oGkC/x3MTQqDMBAG0KvIrDugsT/aq0gXYfLFDpUxJCgF8
 e4NXb7NO6ggKwo9m4Mydi26WkV3aUje3mawhmpyrbu3zl05ecPCssAbb4k/slrUmQMSP4L0o/S
 3DnGgGqSMqN9/Pr3O8wcd0rKRbAAAAA==
X-Change-ID: 20260224-panel-clean-up-kconfig-dep-7dc39c351ef8
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Casey Connolly <casey.connolly@linaro.org>, 
 marijn.suijten@somainline.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=763; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ylQzySUo9bDhSqmkcXiDS7XuuRz2rDXvl6KfxBGmTsY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpoDUwYExGExah3C/W0nE2mYNqta7UJi7PPxWWV
 7dpZCJJvsKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaA1MAAKCRBgAj/E00kg
 cg7/EACFnfUmEKMHILGQCvLLJnQXoHPaFoow9YjXFv1gCJ3jeKLxQCyzhGjI6FoWXx0iz6eRtI+
 Gz3Bf3UlC36fCapfRk1ihlBOjGjHp/DqbhWRjEP+xmAWqrUOn7EHZ1Mtbh8mFEU4D9r9Mqa9YPq
 VidJjpTLDYOMTF0qSBsAuH2Ct9vG+UkGz0rWHo6kdqglCO6CRvDOOMqcdGld7r7jY20EIQdkxhL
 R/oEiQPPSUkMVcuF0lA9dVN62C+PEg5vaDvj1QpmTOwoqDMStYKz6wtyO1KoT6IIUiCn49JV3oy
 bnUZ9H4x5t1j7aNOKtK7uqw0K8GR/kkdrUkTqOiFxVSAG9DT6curjvNHBAVKpcQssfWa1Fu93oL
 XjgMXyCzRcGA0Gj64KDW70xr9rAHF+3T3qNpyDGpO+Dhaa7PwT1+NzpIP7/F0ygoG2KorzO8f0C
 FBcAjiAh95M2GmA0gstI5dqPihDoeKcMmr8OmNTzr2p4pI9IP7zPDPc0m5ZgJa55j+/37lF+LxI
 LRFijk2Hn38Ilqvk70ZxejSLVIUHiV3ZuK8xAA8pZQXm3lzIEaciwgCAT1LpH/po/tWh+gQxqK+
 FwYMspogro4PbgzMpaPgc2qBRW9lEKoGA6BFzgAkB/wI5D5SVWg8dcXb/r8AzxLEnW9A8TmJyDY
 aRHze1IvtMJzsiA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Inspired by looking at Marijn patch. Since Marijn patch is not merged yet,
appending patch to my series.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (3):
      drm/panel: Clean up S6E3FC2X01 config dependencies
      drm/panel: Clean up S6E3HA2 config dependencies and fill help text
      drm/panel: Enable GPIOLIB for panels which uses functions from it

Marijn Suijten (1):
      drm/panel: Clean up SOFEF00 config dependencies

 drivers/gpu/drm/panel/Kconfig | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)
---
base-commit: 877552aa875839314afad7154b5a561889e87ea9
change-id: 20260224-panel-clean-up-kconfig-dep-7dc39c351ef8

Best regards,
-- 
David Heidelberg <david@ixit.cz>



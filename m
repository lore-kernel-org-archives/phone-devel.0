Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795189971;
	b=duytbaMEIIYcBmzrGeuKkffzYyBMIDy0CmKC78XgXZTMgqfgMae0iZRc0WF65sS9RBNP
	 nfC8VkRjYWlAM92NeRjBAbTrCGbL0wzPMABrfwNmff39udEapNFK19zcpGvRb+p3nmUEs
	 JFylKWtF1z3+irGaA36ke4POPAGTpG+q3xU5oTCygX42N0TF5zxH63ymdyqF0/My1CCKc
	 bLLdgjCOa6IqTlA9eC+SEufp5iUMBHDC3tA867wdzqR9gyG4zgD/dWgvp1sCLxOTeAT/g
	 iIKtNXI7JdGSwHgeSVXhSAJuOg+UZcl+DbP3BVAEDKb2VCnGiww/X5PIlzLgGk7bP8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189971;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=sn8TBExBdNMOxU273viLC65/y/HzDXJHEFYgQqnfIzY=;
	b=Kr17YfBO2iGj0mT0KmPKazeumIqMt/o4F7L+7xvzZNvxdTJFqIca1WbIPNjfY9+HJg9W
	 oC1aRpXnEpz6wcV9OiWqD5y0tlTYN6TMvIDbnvgwvX3fttuVH08a0A3i5hwi8F0oTph/I
	 DX5xUEt9KZPmtGcaD2smmaNayoq8X4ghLvdjf/uulujEQqyHDCkwKHzHD1kCzIGPHFRFe
	 97GMEHBXOKdIu1+pK85s+fQ1iPiIOmn1r5cgp6WG9PwAOy5RICLizoiXwA555GJVJ5pSt
	 2YLz7A9ahlz0g3m0xzPK9T9LS6sAbPW4t147tVThidhayxL3nFQdqTsrrGRx30c3cCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LRavwg67;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C82606A33F;
	Fri, 20 Nov 2026 15:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LRavwg67
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795189970;
	b=rcNOFSp0AudMbbhWdAipbbMnadHcvOIrI1OtblQJt1bJ4UNMKsZRARhnRKIwVR2AADbE
	 9V3RXNkKor+guI82HbWJlX4zfaLKJUdVBhE9ouQDor0QxE541TRnzsweWpe2C+bmJGpk6
	 wUT4HZdN/IKSHrTaflOG1BpYMKQOURt8FH65GbUQcptNWQYegqQdlEPMzEXnNPukyjdEB
	 PzYgGGFg6chct+OZv5s9bHvhd7FQkZ36qbghBhB50eSyRo7cHQoPv/e6bUNMR16N8laLE
	 q9pIoTBNIMBYeRWj6S6CshTvXzDN2m8s7Xs8S7X7u4+kPExmdshIr5ayPxEOxbLRetQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795189970;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=sn8TBExBdNMOxU273viLC65/y/HzDXJHEFYgQqnfIzY=;
	b=fo+8PS0G+q7OC4UcdSSoT8GvjKHoSRZivt4WZ7W1f15VfYMScMRBBeFqkVcJpwrfSUs+
	 pzStYRAk1R3OKKkimNV6sgqkaymGBX2i6zFzBYRKTqJKR5pRcd4IZYbaOa8Ic266Iy6uH
	 DyqYEHquoRFc1EMNcKpxR8Gk0bSJm/vrMM8XxqfQ6U3WDr//7RLMHEbv+mj4JxBfzleKZ
	 LYHxlh9vLcdsMy/Z6wuse8HT4rnVcd1i8WcPDDKfbJs4GjyHtfcvk+IOGqWfq1h16LgKs
	 t94ZbW85MIIjo1XmwLWPWvKRoIUWS8dkiqOXg1nLwZAiVHQkJMo3Lhk4VWrN0F088jw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D3511F01571;
	Fri, 20 Nov 2026 15:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795189970;
	bh=sn8TBExBdNMOxU273viLC65/y/HzDXJHEFYgQqnfIzY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=LRavwg67eSV5e9gtrl5mEyhx4U+bHwWtQg+uCAvHPePVExDXWt6+Qb9z8/8X80cpk
	 vMsqds3WGLo4riAg01pJDYwR3283H6crT1V86Ax/qppF9jOtkf1sHVeVDoSZKcs0Kh
	 y95DdOP4fh6bEpRgubUArDW5pewlAlZ3uDPXHuQQ13fh/lF6fs+T3o3WYgq/jx+rsB
	 o7Gd2aRxWXh9CyIxBH7PbqVCKdM0RV52TELGzshsaHm25Hl2bP6oX+19iAszrpPaNR
	 1Chnnnj2LGK9FoROr8why+91GDqebSNxnIZB9V4jTW4kgoGmefGV2y4fym6e4YZu4B
	 GniHNe1ziCHRA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B7CA84990F;
	Fri, 20 Nov 2026 15:52:37 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Subject: [PATCH v2 0/2] drm/msm/adreno: Add Adreno 829 support
Date: Fri, 20 Nov 2026 21:22:36 +0530
Message-Id: <20261120-molokai-a829-v2-0-c63c268d5ab3@yahoo.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0JmbU2nCKGuuIdh0dYio8KYFomE9
 O4Crl2+5P33F4g+kI9wzhYIfqJIPKygDhm4zgw3L+i6MiipSkQsRc9PfhgSplJaaGerQupcojr
 BOnkF39Jnz12aH8e3vXs3bo3N6CiOHOb9b8LN+5OeUEjR2lzKwrZGK6xn0zEfHffQpJS+wF/h0
 roAAAA=
X-Change-ID: 20261116-molokai-a829-9cb850930124
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795189956; l=2690;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=SB/YDmRW4o+ak+TUitU4f8OfQWSywzEFHMWLx5BFo1k=;
 b=U7ZmEKfGozpKWW24mLPOggF8CqlEbLJAPr+rt8kJzl7znAgPmdcrQZYW6/DNlOfTMWMp+Eu3N
 IALFg1qThDIBiNMCxvW4tjoaVzVX26aaZIPQUS9pJ3N+kXDM0TSQjOU
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com

The Qualcomm Molokai (SM8845) SoC has an Adreno 829 (gen8_9_0), a two
slice variant of the Adreno 840 with a smaller GMEM, its own firmware and
a smaller preemption record. This documents its GMU and adds it to the
a8xx catalog.

On msm-next it needs "drm/msm/a6xx: Fall back to MX when GMxC has no
levels" to boot, since the Molokai command DB lists gmxc.lvl without
levels. The SoC devicetree is sent separately in "Add support for the
Qualcomm Molokai (SM8845) and the Motorola Signature".

Tested on the Motorola Signature with the gen80900 firmware: the GPU
boots and Phosh renders on it with freedreno (Mesa needs the msm chip id
0xffff44030a20 added to its A829 entry, which only has the KGSL one).

I used an LLM (Claude) to help write these patches and their commit
messages. I reviewed all of them and tested the result on the device.

---
Changes in v2:
- Drop the Assisted-by trailers and the LLM notes from the commit
  messages, the LLM use is stated in this cover letter.
- Explain in the commit message why the A840 CLX and limits tables
  are not reused.
- Link to v1: https://patch.msgid.link/20261116-molokai-a829-v1-0-fb3005bfa921@yahoo.com

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Venkat Yadlapati (2):
      dt-bindings: display/msm/gmu: Document Adreno 829 GMU
      drm/msm/adreno: Add Adreno 829 support

 .../devicetree/bindings/display/msm/gmu.yaml       |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   3 +-
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c          | 100 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 ++
 4 files changed, 110 insertions(+), 2 deletions(-)
---
base-commit: d024361c631b3f020a26c07d683e5103404b0fbf
change-id: 20261116-molokai-a829-9cb850930124

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>



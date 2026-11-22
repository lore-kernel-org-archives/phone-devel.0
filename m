Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795374525;
	b=JbkTg1ld09883WvlPIYekPNSzGNySLrprGrebMdliTe9uW8CB50hnhWK3UBzOQl8iCh1
	 v6HlcEKOpUeS7AvqVZm81vGV11hgX3spJ03qn+h3RkJy+G9VGaaVomFukofuLnRt1K865
	 q5U8iHov1EDXLFoKozNxJi7JTy7HP6CkRhrEwUpxjCgAncUmNWnRtVMAJu+Nj6qv+HDCX
	 7Y7UZoaYQMORCPqSmP5BNu5YiZjfE8jPzC2jVnQfega/k8kqgQFKLK3hM4RsG9+qGLETH
	 Et5GLYQAsyCu0FuemezC9WccnA56J3rP1u0058zVLeQALxvcW7JlYIujGeoedfBt2cA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374525;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=u2EtW60Jw973dWxj/6S0ahhddRRvKu201RyraM+S3PQ=;
	b=hzHvc3W8D+6ghYAAXdSEpVmVRSXUOsxr0P/rB6nO3iMUwtdBSXWOBNI1jxE8TO9SETjT
	 Ey086+me1UVUb4nH/MICCWm1EvGXiOw1x2rt9iPkYX93zC2GWt4CXtPDav4K8fwswczon
	 ifRfAjqW8b12CC+dnTPmLFViS7mc2KGho/UJHiVoolsd7g5OYxA9JsQSVxLGPYY32WUCQ
	 /ePLNYjB4GBgL2T+jWDuWsRwSYTmy5mD5vOYNRcqekysgyWDz5qokjiriJuqpcDYt3TAA
	 FmTwjHliGmjbr66grkjOwwjhUsPEB9b3Mjf90L/hgOYgNbAAfSN2A7VJIWRJpmru72A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D0iqWVlX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8177D606A68C;
	Sun, 22 Nov 2026 19:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D0iqWVlX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795374525;
	b=J5/fP+Cnc1CZ3MOqqJdepyEi2OChWvAikXGMbLV9zQESH4XZw03jCJjJK8og/S+jPjIz
	 WB/v/bgbLgTPwmRDflOv2QCkZfPZoPEjHzqscm3yhl/X9uxy6ez5fovWCFcM3dCWT8gBn
	 8r6mwgBLakYjMYBllt9yFrGjf1z/4NEimqk2z2cQ4Sw7ZfIScH8/KV1hQ9B8EjcNMrOUz
	 +eazLIhQP5HXFqRjS20P6BVf85qnMCNulLP0IRIlGyDFlaYVmYK0DHI02hWTYHh5ZLVKI
	 4P7PIhP/Rs3FTeEgBHgmGbbMc+uauZPvlq1PEe+wYztrnQAo1N+PlyycBt2rANzh5oA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795374525;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=u2EtW60Jw973dWxj/6S0ahhddRRvKu201RyraM+S3PQ=;
	b=L8J9lD3UJJPTsJoZwUktaN4afKw+caOADZJ5rc9hjqshogAzmPKUSIju3YHRbySBzsjf
	 Dzn1VohYvbuLKFSHORzf0IzavQEYG6kLOt7tW3SLynr9l8DYsNKjeLVZQ3nNrl4e/OY7H
	 7xy4y3JSF9LJyOPNsLZ+1+bp+55iq2EqHPHD+KfAh21sZvjOaZogv38n8CHOolDFk9ahI
	 Rj6dmIRAK67wwebG+GmWMNDMRwat8lNKnOkt6tWv+0YBnHjp0T+wHTKZUKcy0NCkzmMYv
	 d3TBDT3mW/SrWIo9oYK0x0zcotzIhQcZ5hQMhQbndUrm2utzbKqNT6vxOJ4bnQplKSQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D2A611F000D1;
	Sun, 22 Nov 2026 19:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795374525;
	bh=u2EtW60Jw973dWxj/6S0ahhddRRvKu201RyraM+S3PQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=D0iqWVlXLsANu0XsBuWtoEqwE1zBxIK6e2z0JYholBe6V5nS3N5kNquEINA6WqAao
	 Hh6vlViANKWsyvc1SuL1L7wC1YnHuUPTirmUufiEOZZo0x2cb4zPWZaJ3bAJVv9mzB
	 SNo6pcltaufLnoDH9IF9PJh8uL21yKxYG9CS9zKTdEj7u39u5DP/2wcrDb6BSFAtRz
	 nnvcNX1eOcYZLpn198+i84zJujPZAlhnl14fprdfqmNLQshy+SmyVHqIJCVXcPrvLz
	 lFu43faj/rlq+ctSbWFeHWAvgQd/DlInEnRnz2smBntk86URvqo/rSH72fIGGoGjST
	 E+lAhbq4IFKyw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 660D14C19A;
	Sun, 22 Nov 2026 19:08:35 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Subject: [PATCH v4 0/2] Add support for the BOE ILI97680A AMOLED panel of
 the Motorola Signature
Date: Mon, 23 Nov 2026 00:38:33 +0530
Message-Id: <20261123-vantage-panel-v4-0-e9c2f15b318d@yahoo.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQrCMBAF0KtI1kYm0zRYV95DXEza0Ua0KUkNl
 tK7m+pGBF3+4b8/k4gcHEexW00icHLR+S4HvV6JuqXuzNI1OQsENEopIxN1A+VzTx1fZWUNlpo
 ISKPIpg98co/X3uH4zvFuL1wPy8jSaF0cfBhfD5Naer+2k5IgC7BVaRtdoTL7kVrvN7W/iWU74
 V+NWTOS1VujS8b6WxcfGuFbF1kD2AKM0gY1fOp5np/F3XYNOAEAAA==
X-Change-ID: 20261116-vantage-panel-9b6254aa0a42
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795374514; l=2628;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=AiprhAqH/Wu9xU000WEmFRFBDqA3gjsFUkl/eRWDzHA=;
 b=UrFOgMhIc75fCpgwhWq/wjbwgXYZPXM5NilNeDF9fPeRrHiTs1BtdTKWnyZb8gFBQi48njMn1
 PFnZWLYDC+hDkDtlSJjhFRcwf7LAGVBWpciFEApAIWRRvV+Wmmos2yA
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com

The Motorola Signature uses a 1264x2780 BOE AMOLED panel driven by an
Ilitek ILI97680A. It is a MIPI DSI command mode panel with DSC 1.2
compression on four lanes. This series adds the devicetree binding and a
driver for it.

Two things are specific to this panel. The DSC picture parameter set is
written to a vendor register on command page 7 instead of being sent as a
standard PPS packet, and the brightness range is 0 to 16180 over DCS.

Tested on a Motorola Signature with the msm DRM driver: the panel lights
up at its native resolution and Phosh renders on it.

I used an LLM (Claude) to help write these patches and their commit
messages. I reviewed all of them and tested the result on the device.

---
Changes in v4:
- Binding: drop port from the required properties.
- MAINTAINERS: add the driver file in the driver patch, where it is
  created, instead of in the binding patch.
- Add Krzysztof's Reviewed-by to the binding.
- Link to v3: https://patch.msgid.link/20261120-vantage-panel-v3-0-00b306146240@yahoo.com

Changes in v3:
- Drop the Assisted-by trailers and the LLM notes from the commit
  messages, the LLM use is stated in this cover letter.
- Drop an unused include, fill the DSC configuration before adding the
  panel and describe the PPS layout in the comment.
- Link to v2: https://patch.msgid.link/20261116-vantage-panel-v2-0-e2ab48645e2c@yahoo.com

Changes in v2:
- Give the panel its own compatible, "motorola,vantage-boe-ili97680a",
  with "ilitek,ili97680a" as fallback: the mode, DSC settings and
  initialization sequence belong to this BOE panel, not to every
  ILI97680A panel. BOE's part number is not known, so the name follows
  the "<device>-<glass vendor>-<controller>" style of the Xiaomi and
  Lenovo NT36523 panels.
- Driver: match the panel compatible.
- Link to v1: https://patch.msgid.link/20261116-vantage-panel-v1-0-30b95bd49216@yahoo.com

---
Venkat Yadlapati (2):
      dt-bindings: display: panel: Add Ilitek ILI97680A
      drm/panel: Add Ilitek ILI97680A DSC command mode panel driver

 .../bindings/display/panel/ilitek,ili97680a.yaml   |  74 +++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/panel/Kconfig                      |  16 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili97680a.c     | 495 +++++++++++++++++++++
 5 files changed, 592 insertions(+)
---
base-commit: 39e407b553ec15d4a233b651531ad431ed7542be
change-id: 20261116-vantage-panel-9b6254aa0a42

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>



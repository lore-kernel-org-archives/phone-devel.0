Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795190014;
	b=liE06sqCaifhkCZPa6URI3vzD+1fvn3O7/t9O03qYlW/XsdIeYelnKZPgTq4pZr3Dn7e
	 A+VEdlEcfpimM1rB9PNXgTkfMdBkS4zrZ/EnYTeRX6q00VGAS2lLO28TyzUPtPDgFY76I
	 /I0iDfKz2C0xJFSfgdQHhurDamg40DFVJ5mi+4m84hLBPFGQisVpkSXL3dqbEzPjO/l4m
	 D/aMjKseZVSOWillq6c1IRmxeIWvc2nfhK5Gtf9W6D6IXF3BYMMiLMiqgKIFUrz2Pv0MY
	 M92eyhVEPrYMbnBV5mahitQXanBAoadMYMkdXrG73ZHgsyw/WKa23q/4mIe0I268RBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190014;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=UhJ1zxKSlz8I9hqrDRWa0MRQjNQm9OFBh0TVKIyoXoA=;
	b=eDCxhTrEl9yBp64E1pQHaIvSC0mOhB1PUXE0pkFdtiC63qfSS1TjX01maM1fjVZuyZJI
	 IaA91EDY7C4j4K5m8Q4acnTPMWn7w4KzkvSX/GaYE3eNbGbnSS7GGBGmGsUMfxcHuBuiD
	 CFyjCGAte4WQTlZeGIstbq5RN69Is8dN7T881KuIQ0aLJbOCX/rr5mPH8U3vGtfq+S3gv
	 WeZPcCm8RC1sQ+bJRAW6neb7nPRV4yxScben4CFTn/HAI6aM5LhE9muIDozfN70R3/IiY
	 jN58dZp2prhh0IhA5+aomLpub86DtArpyGniBOYTk3/3LpVR5t+1uwYU+14+Gwuf/fA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hHIG8Q/V";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6019260A2606;
	Fri, 20 Nov 2026 15:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hHIG8Q/V
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795190014;
	b=0m7h10WS9IzbZrAAPtfG6h+S0OfHHLFoU+Tyehq+JTdigwFPxuDSBDZuNMaylmPhS/Gi
	 Gu66hxWnef8/ebdsWoLFzq8RnUe0IqRm1aWrjK8GqGdOQt9ac3T9q1x+WrR4WMZf/921x
	 eXQYssF26cMDALcz3NBiHIh9asHYR4zAdtylUUQCOEF0BI8w3bl11ZU9iQqMW+/q2CQxA
	 VirjSK5LSCCTtY9hT6GZ9uFUWHEjRb6IoZ47wOHYG6j8LF/uLXtdkkPIKBsh1joYFr3ve
	 r7/cc6zdplJ7Xy4BnAMzgSNvxy26Jmg3x5r6Kl6sgNUKvBJykLb07qbLOaPSiFu7PaA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795190014;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=UhJ1zxKSlz8I9hqrDRWa0MRQjNQm9OFBh0TVKIyoXoA=;
	b=YxoYJufeytix4LvQksfA3a33+wlU2d4/mPeBK22qPWxVVc9/OLqI+EQHICsdmEjrH48M
	 HzRlqovWn+mlaCXJHkyROOGTDOebjSJJ5NmxADw95ljeEXWAHKG9Ntkstn3ZUezz/3khn
	 G7V6LLVFgBIbxl0Bv2fS9MC1khXDH63o6saucEJ5ZpE1sVKTiNUcsyUT5C31NX7OdJZnH
	 jZL3DfTOFGssOKQu/EzwJDzEt6c1teDMltk1VM+C7ZKrxACfIzn5h5YWKVl4N5MBP/KAC
	 aX4L7I7wBMwmNG1CKFwClG2MRxL9hC63TjjRuBHEmJJQ8ul8jwqNz19KnqUtO5GTNBQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 204251F000E6;
	Fri, 20 Nov 2026 15:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795190013;
	bh=UhJ1zxKSlz8I9hqrDRWa0MRQjNQm9OFBh0TVKIyoXoA=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=hHIG8Q/Vv4mUxO/be4AX4iv2qBu2e8hCjVPH6UNyi9Gvxse8tRGCUHQy7KiJeB2IJ
	 B0xHy+DI3VLXnIOWn1aajYLWL6eUwvgG8Ce9Ys4rqKgraSQXc+qIh4ME3MA8k+pPv6
	 JHcLtrc0TqLPb81Ry/Xof6c3F09/WKP7RTkCpEc+NBe8Eln159552aYrkWrF9wr5Ed
	 Grljkii2Te6eyNmdE1637KWYHtI/cbVdSZZ8ALvQA/+v1FgALECuGm2qHPCakVAg9O
	 OsE6uFAx7OwpoQIhtyK2ukKUwu7FevDtOfMo7WGsHQpi33ZtLMwYQuRkoFXgRJFVP+
	 tM7VQz4yYY0Sw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 961C349956;
	Fri, 20 Nov 2026 15:53:12 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Subject: [PATCH v3 0/2] Add support for the BOE ILI97680A AMOLED panel of
 the Motorola Signature
Date: Fri, 20 Nov 2026 21:23:11 +0530
Message-Id: <20261120-vantage-panel-v3-0-00b306146240@yahoo.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ7CIBBFr2JYi4EpJdaV9zAuBjpajJYGKrFpe
 nehbtzo8k3+ezOzSMFRZIfNzAIlF53vM1TbDbMd9lfirs3MQICWUmqesB8xnwfs6c4bo6FWiAI
 VsOwMgS7utfZO5w/Hp7mRHUukLDoXRx+m9WGSZfernSQXvBKmqU2rGpD6OGHn/c76ByvtBH9ty
 DYBGrXXqiaw3/ayLG8dsNlU+gAAAA==
X-Change-ID: 20261116-vantage-panel-9b6254aa0a42
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795189991; l=2895;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=aPbq/A5mUd6zF5e0lex8/Mk32wpdmYakJPFksuVGZXk=;
 b=lVbrb//Drjpuo+bKe5Gzl+EChAL+2FzEXujU0Tuh6l5/k7VLx7ROJAb3/R7ApP1ZmZxBAM2rn
 tATubxQMChRBrnzHn2Cx4RZTPui9NffftAawwJIx3JU9dfh0+7hh6mq
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

To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Venkat Yadlapati (2):
      dt-bindings: display: panel: Add Ilitek ILI97680A
      drm/panel: Add Ilitek ILI97680A DSC command mode panel driver

 .../bindings/display/panel/ilitek,ili97680a.yaml   |  75 ++++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/panel/Kconfig                      |  16 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili97680a.c     | 495 +++++++++++++++++++++
 5 files changed, 593 insertions(+)
---
base-commit: 39e407b553ec15d4a233b651531ad431ed7542be
change-id: 20261116-vantage-panel-9b6254aa0a42

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>



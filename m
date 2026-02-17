Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886D223ABBE
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 07:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771311734; cv=none; b=cgMcbMufTKSO0SGrhet0SxzH6iQljm6RBpkf/D0QPN5B4vyh1Kp0t3eS8eB9pbIdFnq4lSG9ITXkHYZhNcMC14WyHPZqSxycbfV5FFuA0W2iU4kcKSeT3qfZygL05FYgTjAqf+TBZUbFdSh7xBzfBA0PN/UL0+4Z4ElLqyiQN50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771311734; c=relaxed/simple;
	bh=1hk0exkk1KCokWv5ViVkN1CYOhBQgaxmdg5eenjt+kM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bUakGQ0y00PHPE01i7vvz6obTUlQTRcldbyNmVBzNZoQ3kYzAfk7WYLcV2ZMh5sWbwV05TPAnlsDrw7ADxm2cUNjbR0nR84Zr9wUuomz/8orpnBVmLRrImjZyhxEuRGpaw3ESsQhL0rPXFf6nGe3FROJffM3kvbrWVg8aI/eiXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=WBqlUmvE; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="WBqlUmvE"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1771311728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zUH05RbcDKrVZ3mWgOuCihrh/dQqabKb93Ry9N9l9zE=;
	b=WBqlUmvEwcOPdTptiljG115H5shcWrOGqTNsqS+JxenTvJ4gE5SvT9hjWO1UxqenYJnyth
	SOKKSKCTz1CkMQf74jithI/tH3BNtcziv1bcQ1YK81Q8HWto9h26X/qlJhaccRqnFuy8jd
	j625sJXOBKVpZcYtS5GpbkLJZGezR4EMH0Owd0PH9SYDb7wNPS1WBxoBGz9KBUJnMJGTpP
	ic7DRARekBq5m/eAwmCx6wpNDq/SzVxgT1an+0OaL3XS5Sc1814MQsg73sHRo5vgrmyIIb
	49tZeYh+V9ndP9ORXbiCT+9rC6nZkv+sxYoFZ8GkIqGTCC78vwQGH7fyY+ASnw==
From: Val Packett <val@packett.cool>
To: 
Cc: dri-devel@lists.freedesktop.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: [PATCH 0/4] Add support for hx83102-based Holitech HTF065H045 panel
Date: Tue, 17 Feb 2026 04:00:08 -0300
Message-ID: <20260217070121.190108-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This 720x1600 panel is found in several Motorola/Lenovo smartphones.
It will be used in the device tree for the Moto G9 Play (sm6115-motorola-guamp).
Fully tested on it, including brightness adjustment.

The initialization sequence is based on leaked documentation found online :)
as the sequence included in downstream Android DTS was near-empty (I think it
relies on the bootloader to do the bulk of the initialization).
That documentation is also the source for the exact model number (as it's the
same vendor, same controller IC, same resolution, and made for Motorola).

Thanks,
~val

Val Packett (4):
  dt-bindings: vendor-prefixes: Add Holitech
  dt-bindings: display: panel: Add compatible for Holitech HTF065H045
  drm/panel: himax-hx83102: Add support for Holitech HTF065H045
  drm/panel: himax-hx83102: Add support for DSI DCS backlight control

 .../bindings/display/panel/himax,hx83102.yaml |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/panel-himax-hx83102.c   | 151 ++++++++++++++++++
 3 files changed, 155 insertions(+)

-- 
2.52.0


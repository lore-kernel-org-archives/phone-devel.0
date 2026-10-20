Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484045;
	b=o6eZ8xIFennYqNFikbb1An5GWvmo93kVi/wx82cxey6F4bukKCuWqHx15WzP4PKs0nri
	 6MICqh8D2F/+J74lOn+qwpIIy1J0doDaDWnJFqxCuW6gJcnX6sJVX5NYuB4BvtYHOq1sx
	 6UiY3EQ18T8J2MkI0lVFPVb3EuMdkvaF04QQvOf2KOb/VtLV08OecZx1Xz2Klq6E2YaFz
	 m4H3m6r3TFkRV/2o2av01WJWdFPSX8c0VmvEHPOIZM32uuZNoetDDe79T6mcIwmqtzofm
	 cg0hwPqwPlZY++s/RzAFlR1bwi5ddkvTVERmgyeLsG0q7L0C/sLnf5VnltetBPyF0vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484045;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=X4bINhtKBaaElpvArj+vZ2TGO7bG1iKJJOaA7N4cXl0=;
	b=4u47JILvEyksbGCxPqS5xN3ASdueSv6TjZxWG5Tbze71+2qMGFrbx+YMnrWXiwOCuXlE
	 cBV44K+K043YeRGiOUSN9iOBRRiuysLWgzvhvd2+YG4+HvCcNUBKQ4JDVc2TQPhDlrfil
	 Ruos5tePa7N0mIcCzzsxMEuWR1ZQbJhsrF8kSdnqn5ig5mV0KD93buZfhXmN/1QqMEe+F
	 sqn1eY2j68y8q42V1+owY87WaIaOzQmmqtyJ9GNcniOMhcxUbjb5K4tow95GpDaRr1H7L
	 96dWLdUNkv2yfX7JXTODZUDkkXuOkU+b5etsJ8LpRtSyt54f+d+a54o2fh3ct2MpmRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=A5DvPyUa;
	arc=none smtp.remote-ip=91.218.175.29
Received: from mta0.migadu.com (out-29.mta0.migadu.com [91.218.175.29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4253606A31D
	for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 08:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4253606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=A5DvPyUa
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=t+xbYwZwz/irX9ML7U6cwCqnY9N37pIe4TbNWL6A6gc=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792484036; v=1; x=1793088836;
 b=A5DvPyUaSKRFg0gGTWbB5dDM8mSWOYUwIDdrkG9aKUSeZuCcQnUV4fBHS9ScDNJlWAqVFV5q
 qKkMCsgzYYmUq36IlPsXSA8xS1IptKYvXlHsaSISkxtj1LclCWESeSUy3FtEzDmUP1izxdySlZu
 9YBtxNo1MZNW0Zdv81NiDvwyAOU7Ccj/ho31x9X39Tq8hFzTwzA40uO/8/8la32OghjSY0HXlyf
 xYKqZARh0kTGpX2IenbtjvZjJMyLT8jX15MyoRrs9Q752/AExfZKSDFWQDBvHN6DcEtxZ0U5KwI
 uRLf+vgV4GDyMoaK7kWLdiOi7ahWLx7b+8PbRoEkBctoQ==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 56071984f75ef8a4;
	Tue, 20 Oct 2026 08:13:56 +0000
X-Mizu-Trace-ID: 56071984f75ef8a4
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] usb: typec: fsa4480: Support reporting hotplug events to a codec
Date: Tue, 20 Oct 2026 05:12:52 -0300
Message-ID: <20261020081343.1507986-1-val@packett.cool>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the fsa4480 USB-C SBU MUX is not actually used with audio
codecs in mainline. I have gotten it to work with the wcd937x codec
on sm7325-motorola-dubai (copying the Type-C notification handler
code from wcd939x to wcd937x, will be sent after this).

v2:
  * Rephrase dt-binding commit/desc to be about hw connections (Krzysztof)
  * Remove usb-switch-ports.yaml, inherit port instead of port-base
    for port@1, require port@0 inside of ports (sashiko-bot)
  * Put the codec/codec_switch references in fsa4480_remove (sashiko-bot)
    (also I thought about this myself but assumed they were managed when
     successfully attached.. but no, looks like they are not)
v1: https://lore.kernel.org/all/20261018225906.1265299-1-val@packett.cool/

Thanks,
~val

---

Luca Weiss (1):
  usb: typec: fsa4480: Report switch & mux events to codec

Val Packett (1):
  dt-bindings: usb: fsa4480: Add an optional audio port/endpoint

 .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 99 +++++++++++++------
 drivers/usb/typec/mux/fsa4480.c               | 57 +++++++++--
 2 files changed, 118 insertions(+), 38 deletions(-)

-- 
2.55.0


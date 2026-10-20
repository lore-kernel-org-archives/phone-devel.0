Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515854;
	b=EyGFe8v2OVHZvxwaP660HZ4L66XQqC3H+17dcH10pJBt/CA+qCNMd6654yk+igK1k5iG
	 2jwROaFSj8SxZIuEr23I7LERnI8kGdorDC+rGwbh+9sS3CXLzDuJVH9KzR79o4/T6nnd9
	 ElIKF0k1Q0P9iOBisYR3qdjEWZX8bBrHhUvsxhv3uxrAiyxj3dItZ6J31xI4ceXvmOuSe
	 61bZZBj70YbX/Tl+PMlTt2xZ+p82eS0xnpzroYOhNNJbr39JASg9FcL5JtF5HQNlKu5gW
	 fbB5An/soDgxckMTyrMUt3APVwsd0pRxxaK2r8BcCejZiADctGfYJGZXERnKykSkXlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515854;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ilOCs9JW1eswWZldgI01PyWwMif6Q2IZWcYqSQMNIxA=;
	b=C8gh3KZdYp2NXrCzFUMSefNMRoxm1sCD5ugQnY1/NPN+1dPO6lA84M0OUe1rGaxWfl3H
	 fgiFjNNXvPb4uktL1j12Kpg+MAQhZVnng+Pu/oQHl+mISF1ZG6KRDbLOtEqGFb/tRi1g1
	 tG7+vgQUKgrR2pJcZnrphGXKE65piiwpp5TBPMjUPmtNjUtgjUFIUP54TO7KLTsWbcn67
	 gpxbmA7vPN8WgutO1OASGZFzSp2jvnZ+vmp9Oe050TfMCUUocPwBFIlQfS480MykzlHrF
	 QGhHjsByBGTZPhu5H/NU2HFEWAa+XbYmzszQsyXo17nfW0loso8FCFKJO3MdJK2xQQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=V+rMYEfP;
	arc=none smtp.remote-ip=95.215.58.112
Received: from mta1.migadu.com (out-112.mta1.migadu.com [95.215.58.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A372606A32A
	for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 17:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A372606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=V+rMYEfP
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=V6YUdxWoTDNnXagrWvpsYWqhtgXuh09OxHBYpt8V1OY=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792515849; v=1; x=1793120649;
 b=V+rMYEfPpdixn7DUAqM0f7nVIQNQYqb4ivhnbZ6nr7ZMox6QJlwWWFMS2gRubbPmJrIoNfLp
 kWBRj1RWAieWO8DJEGFFBGKJbZLSYUYULAaZFtna9N0Hz7lNQc8rvl+iIMQqgCUDRjf1K/RDJSf
 yzs09BMC1YrcuV0O3QN05sh/0KjIx4Rq+EV+CgBCpmFmHNX5W+1bx9ZzGRTqYGlQom1a5LxSAnn
 XFRlU9U77fXLTfkORPiUary8PjzMAeigdrn5ohevnnV/krZq01+URA9VEL5FQPLB1bFJdDnMux3
 0dzf7fgUvIvjdbGG+I5p65ZD3Y9lnQwvEL+myflGVQ36w==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 22d13bc26f5e4975;
	Tue, 20 Oct 2026 17:04:07 +0000
X-Mizu-Trace-ID: 22d13bc26f5e4975
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] ASoC: codecs: wcd937x: add USB Type-C analog audio mux support
Date: Tue, 20 Oct 2026 14:03:24 -0300
Message-ID: <20261020170341.1641325-1-val@packett.cool>
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

Currently only wcd939x has support for USB-C SBU audio in mainline, but the
older WCD codecs can do the same thing 939x does with USBSS, with an
external 3rd party mux instead. This series adds support for that based on
wcd939x code.

Tested on sm7325-motorola-dubai.

v3:
  * Zero initialize the device_node with the __free, oops (sashiko-bot)
  * Clear the pointer in wcd93[79]x_mbhc_deinit before tearing down the
    actual wcd_mbhc object (sashiko-bot)
    * Hopefully this is good enough to satisfy the concern about
      getting a typec notification *while removing the codec* which is
      something that has an extremely low chance of ever happening in
      practice anyway. I'm not adding an extra mutex for this. I'm tired.
  * Pull R-b for the commit in the middle but not for the other ones
    because of the changes above.. (prooobably would've been ok but well)
v2: https://lore.kernel.org/all/20261020082631.1509275-1-val@packett.cool/
v1: https://lore.kernel.org/all/20261018231244.1266926-1-val@packett.cool/

Thanks,
~val

---

Val Packett (4):
  ASoC: dt-bindings: qcom,wcd937x: Add USB-C graph properties
  ASoC: codecs: wcd937x: add USB Type-C analog audio mux support
  ASoC: codecs: wcd-mbhc: guard against NULL cfg in
    typec_report_(un)plug
  ASoC: codecs: wcd939x: fix ref leak and NULL deref with USB-C audio

 .../bindings/sound/qcom,wcd937x.yaml          |  15 ++
 sound/soc/codecs/Kconfig                      |   2 +
 sound/soc/codecs/wcd-mbhc-v2.c                |   4 +-
 sound/soc/codecs/wcd937x.c                    | 170 +++++++++++++++++-
 sound/soc/codecs/wcd939x.c                    |  21 ++-
 5 files changed, 198 insertions(+), 14 deletions(-)

-- 
2.55.0


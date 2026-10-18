Received: from mta0.migadu.com (out-124.mta0.migadu.com [91.218.175.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099633DEAFA
	for <phone-devel@vger.kernel.org>; Sun, 18 Oct 2026 23:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792365187; cv=none; b=Q6H0dnxruhaZ0L09aprbohq36OV0fviTHzq2WkxcIplF6y7iniu+u/jaXsLgvqDFH5ILdlIcHATurMe3aHzfg6YAHcO397Xp2iiwGdWgvJrIL9L5iguTdDtxeqCPofuVDe5Glln1H6Ztc78o4nbgilO2UNQdTMbhuylh9QK4QPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792365187; c=relaxed/simple;
	bh=Mb3rmHJTR0zoyOC45CYjoEjYWAyDYfWRwLnj6OnHt0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aAMNClkjx9vBZM6jbArUkzIxMuqnEDhYMJQry5dVsYuB4B4a12OqTJzslWzWdq2/fPNe6PlhO/ToLzDfFKrBWdbrAQPJQI1EtGmI8wdTXfgAaTh8lED5Pwo/8sYwxnkvhPpAT1AXevKs+jE4hGf1BG8EcI5JXFdP6xwoOBxfEu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=RdvoxVKh; arc=none smtp.client-ip=91.218.175.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="RdvoxVKh"
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Mb3rmHJTR0zoyOC45CYjoEjYWAyDYfWRwLnj6OnHt0s=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792365181; v=1; x=1792969981;
 b=RdvoxVKhf+5RwJN1T9VM+uiqovzLbq9iPbZPkJJnA8MxrK9JPuqedTpdKoa+NrvM/3Aw6n+d
 B3D8Um03Y6tfzJr/4UR2e7zWQLbxTPkXHI+BkuZop0ugSHpxRwyLGHKU5g1KXGGSmlmi8LQEsdX
 OcCeJFFq+3/GZ6na3qEjU82NP1ZZd4mz4SKFRfdUxgwl0GHFEMpCvw13tJj32YwIA+t0ly3RpEv
 BpZrK2pplJUqH9/We1nT8kMGQMGp3IAYDgJYjKITV1T17vdbkwamaEveSGTO/vKG/YXGwwjvphw
 PezrJt2XmMBxuA201kO14Nx0Av2Zc+dSwQ+OIc8HTRBUg==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 57022a8225cf4c59;
	Sun, 18 Oct 2026 23:13:01 +0000
X-Mizu-Trace-ID: 57022a8225cf4c59
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
Subject: [PATCH 0/2] ASoC: codecs: wcd937x: add USB Type-C analog audio mux support
Date: Sun, 18 Oct 2026 20:12:28 -0300
Message-ID: <20261018231244.1266926-1-val@packett.cool>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently only wcd939x has support for USB-C SBU audio in mainline, but the
older WCD codecs can do the same thing 939x does with USBSS, with an
external 3rd party mux instead. This series adds support for that based on
wcd939x code.

Tested with the FSA4480 (with the [1] series) on sm7325-motorola-dubai.

[1]: https://lore.kernel.org/all/20261018225906.1265299-1-val@packett.cool/

Thanks,
~val

---

Val Packett (2):
  ASoC: dt-bindings: qcom,wcd937x: Add USB-C graph properties
  ASoC: codecs: wcd937x: add USB Type-C analog audio mux support

 .../bindings/sound/qcom,wcd937x.yaml          |  15 ++
 sound/soc/codecs/wcd937x.c                    | 151 +++++++++++++++++-
 2 files changed, 163 insertions(+), 3 deletions(-)

-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466054;
	b=A81Q3cENEMM+TJKdDbenEXAxL8twipGAILLkHTYinsLzQQusx5HWnqR9Zd8wHLeg7KoC
	 FGoaUySIbvePVnlPfh5u5HMPPkBXyItWUGFNpj0PvIJZiI4GeuNH0hZzFulx3g9g9xa+2
	 CN/kDwY1+lemGM1NN+4vmWlkw6b7gvg0kQ4dS4Ya+eiOntOO0fruTRJY1tZ2ts0s9LWm6
	 HX2mjcAvgkkiIfqIxkVECPPGS7XcXP2tcr5QB+/r7OqB804Hg2x8zc3itzzMLzHxyJF9c
	 szn74ncqDnbLVfNE+D3Lu4GTsVzRKBKUS/yQKMqK4PBvUp2LQ1gAk9GaOZye1t9Z6kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6OR603YV4U0OwPPTqnIgdhTgPtFX3ZXpQfBjAD1u2oU=;
	b=grML4R5J35JlgIIhbu7KfIqjQXZaDQ+U0ONq0PnPXBmO2wYmxx7U8jcQI6y6UfGwylQE
	 5vXXWHE1EVkpTjv3gNgSQ1iwVDKkhueRtZe9+/sPyKq2adzA0Xg3zZZ1qjmfXWvJin9rl
	 DwVupsl6Da3SBQqXhxdRhtVgjDNPBPmlvRM50cHSufEqmGXZsOixwjV9dRPjAsn+giyW6
	 VjagJsjPyVgLYApVQnS34SMTilEjXpCnfGbXblaEzugJAnGPcBPh4cRbZFdRpp4Gggd0F
	 k135p/vbX84rQV303UjoWOK80OqSJkY4pPTkHCm3BZqn86MU9IBp+NnN0wG54XJj6ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z8KvwE2H;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACCA606A6B6
	for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 20:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ACCA606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z8KvwE2H
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so35880625e9.1
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 12:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466053; x=1796070853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6OR603YV4U0OwPPTqnIgdhTgPtFX3ZXpQfBjAD1u2oU=;
        b=Z8KvwE2HmbcjiuKTw78Oy+YNYHN8GNMgYBZwyBWDc/CS0fSAzLEia6d20eoogHK0Hn
         vOuMZc1tGZkHl7DRiiN+t3bG2IFgC252SnyjViZZKXxG9fRFGcYKfrBO+gk8UHSk3PWe
         S4iem9nIFGhaqX9NQ4Js9uiYZ1+inGXClZv/XXVbBl4Y69Qr784kcrIcx08WVIOgzljm
         plrZjF8lPFXblMkh0/Wvq2uMJQ9p88D/hQep5TZFnT808MyazsF/ICLskauneupXUkER
         9bkaRo6Qx+GEcxY/itzEn9R2ug2yuZuI5MRf0EGq41C1Fta/MjuipuTd+qCOu4na/voY
         H/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466053; x=1796070853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6OR603YV4U0OwPPTqnIgdhTgPtFX3ZXpQfBjAD1u2oU=;
        b=cABwFCaEllM0IBxSl6jWlx4yRnNSxFR5I3yFAoIZH1ijgwSlmy5VvPyCA2MsfBiMaZ
         W42KnEEFxAgg+ifU/N91futRANq2P7/MSdL6rr1HJPkLChOoor06eqg1Fi2Q4Iya7JEE
         gq4XVRqLnnBrrFWmuo+ur13JcXoRpLbMr7WjqpxiBcCceWHBnqw8gFwdB4TVmlGbPTu6
         y9pDTUDr7TuTBQ2P/SuURMydyEqID/LZfhCiuwQtJs4kMzveOfvQ1Fw0XLytvTFdVrzG
         YeGo+MrvLWD1TFvhXcQyhzxTnNsBZGEXH+lETrh+DVikdxiHIp0K0iu3C3WQOqn6/3Fl
         etBA==
X-Forwarded-Encrypted: i=1; AL+hErGJMGrm24khjgJd0iPVFZHdl4D10i9+rAQTQDopV7o9RXiyzjeWxGDx+CTcME4t2XIX7ZRJIr0mssVTDQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9RyXSFrnfha8j2dsE+yGhdrxD7wlmU2d9UMEoA1wuOebvb0H7A
	b6NbsmxfcqvOvTjc/hVureMguZB/qla5FH58fspAJxhwbRspgEFKf7pQ
X-Gm-Gg: AZFdTZfkLmJ4vwyNXHU2c7k9siA16xIMwzMWded6MOVmfho7Rie4n+hiC8iC6BKqmXJ
	0LJw4WtED087YW0ySdSohRF+MQbndq3O6h0VaIo4FffDRd7hizw7p7U96W9Fg6qAL2l1t8H8P3P
	KrqHTzln3i/tEfz5Fm/kk6T3Csz6tOUSu+t1SK9ewcuMIYVnCjN38EXQWbncpyGRTEwT8PkjF0S
	tcFILB3ZHBmpsI/lh6Ji2ka3TN+n5eaXzdTiPcD296zJKGhTbhTmrIUzSrJqrR1t7ykF+AX4NRw
	7mc8ATOIc3IVA/MEpwDHtEBB31nbuVOGn838GMZ9iKz65yQ5W3SKeIBl0QWMoX+9NLvNGUJjvmb
	TQ9LTjHs/l5U9reg3GCFMP3RP4SIKBbR2AW/MeRAhmHgpAqibt/9pEAd8j4FwNozzNuuwSRdRgY
	rMn8Di1Kgrr8LUpMDUDA9yLTdfJQZQuQ5rJsY5Elu78GpJp/3hBG6iZjjkC5TeBln+Rk08Pt4fb
	P0nUAjQ9UCMQ12hS/dux7VvIqOZMFbN1KnwePS/xO5Pge4+swSloghPljy6CMesm9cf60R/9TGC
	focHyEsZwKNzKSRsPS7j9Yh2okTshw==
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr275019355e9.14.1795466052668;
        Mon, 23 Nov 2026 12:34:12 -0800 (PST)
Received: from unknown.local ([151.34.53.154])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm515946805e9.13.2026.11.23.12.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:34:12 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Date: Mon, 23 Nov 2026 21:33:55 +0100
Subject: [PATCH 3/5] media: ccs: Store the format set on a sink pad
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
Message-Id: <20261123-b4-ccs-imx376-v1-3-2b26850a6f11@gmail.com>
References: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
In-Reply-To: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, stable@vger.kernel.org, 
 Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795466045; l=1782;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=4SRiFW3bBAJ1IlBIN9DDyNFw3BbzT3m+KdYlz1JrA0Y=;
 b=l6DYb4OFrWa8aj8hDAV/Ql3Ppfpp3sLbxSS9XESSX/YP2O41q74bDTNHZvj54ZnsZPqr/xJx3
 rqMTCmBBAI2BQpjfkeyJakYJMMHHDCYCa1+p9Lfedm9CmP0aFocujWP
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

Setting the format on the sink pad of the binner or the scaler only
updated the crop and compose rectangles of the sub-device and its source
pad, the format itself was never stored in the sub-device state. Reading
the format back returned the one set up by ccs_init_state(), i.e. the
size of the pixel array, and the selection rectangles, which depend on
the size of the sink pad format, were bounded by it.

Link validation then fails with -EPIPE for any readout mode that does not
output the full pixel array: the scaler's sink pad format is the pixel
array size whereas the binner's source pad format is the binned size, and
there is no way to make the two match from user space since setting the
sink format has no effect.

Before the sub-device active state was used, the active sink format was
stored in struct ccs_subdev (sink_fmt) in ccs_set_format(). The switch to
the sub-device state dropped storing it. Store it in the state again.

Fixes: d8bca3ed1d70 ("media: ccs: Use sub-device active state")
Cc: stable@vger.kernel.org
Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 1cc4350856fd..a4af27de5453 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2275,6 +2275,9 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 		      CCS_LIM(sensor, MIN_Y_OUTPUT_SIZE),
 		      CCS_LIM(sensor, MAX_Y_OUTPUT_SIZE));
 
+	*v4l2_subdev_state_get_format(sd_state, ssd->sink_pad,
+				      CCS_STREAM_PIXEL) = fmt->format;
+
 	crop = v4l2_subdev_state_get_crop(sd_state, ssd->sink_pad,
 					  CCS_STREAM_PIXEL);
 

-- 
2.56.1


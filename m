Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466051;
	b=pCpsOgojLuTnr1p/8iJSVYFDKpLcqT57OkjsKzZroty41LqGQ1PXbDpd10PGvey79NCV
	 A6MNRoZQ0KfxcUrdeNPwHFUg3o6LnUpYQV2FCTY53Uv75F1X/CUqn7Kzg4duVal7Uaiy0
	 DxbsPH7N/od1zcTmEMEvagvlOUQ6axSxEAO0ec+iglQQObFI2GDalMmzox4Qv5Fjm3OQG
	 zKwG/V/Z+XG9PXtlROW3vEtxz1wnRxgRkptcnrsXsywx4zMbvXmRXXS8yM+EvP1Ylq2Mj
	 RqwvNF8wPge4wN7IPO3+GWWRQEVzjyRB+oTcpfDOlgapR5967IPQhAXpjn0wuozGGWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aIw52i3FBNaM3JlX95PdSZS9UEeuj75BOGnG58YJQCs=;
	b=U2Nvk+jfnBfJ6X29ZrQoaiEVKySz9EShMhjcUaRm4hSFln7PTfpsQm99Y7CTYOAkm+EA
	 7ZkJOoaby1yBn0wwHlTyalwOJhieNofnekuXdgIABbyXVSU/5YKn889hpZzNKNh6eRRIk
	 /QbnmjU+Jr83DzTjv997YtL8OFgAN+8V5KOH6i1qpBCaxXh8qIzPpExtshnALhOl+4rNd
	 33i3R3FyRxuXTNfPdWA2uiSaphovTeVsLfVIaH7c3uhGb0oeX0sAW9iqZvzkzI34nVLxB
	 0o25S1wUMU7u2dQc1mMkALCb9Lgfqd+WTUclgaEfe16wlq0Dg9JvlCDgaIEubaDQV6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aIdd2c40;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C119606A327
	for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 20:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C119606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aIdd2c40
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4aa5833c263so3588556f8f.2
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 12:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466050; x=1796070850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIw52i3FBNaM3JlX95PdSZS9UEeuj75BOGnG58YJQCs=;
        b=aIdd2c40s7v7UqrYtMn/jdUeRjG7uf8VxYLfXRlPixAm9l4+qo6Zry/e6kW5iGuQXM
         4/4QjacbUa4z6jrFzYieNIM7FCZYdR5wA0z1BdcOXepZG+ucsqAktjaO4/HLL4LowQHL
         pWwSA/9NXB6tx3Muc4nGbSrho2WWMRPvv7tGDpOO86m6ixO7BgKtDgcdPGcK1iTp33OF
         P2RLNpMUhxb9Gyng/a2C6ur7+sxnjgVZvD1s0pvNxm7fBq/XCKdduImgG0m6BNW34Rxa
         7i7bTPnLoc0cuzhpnbEz4wD1Wmm6q3whg+F1cgcb2EbpIzVh16l8mf4QVQOpu306DGtM
         9mWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466050; x=1796070850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIw52i3FBNaM3JlX95PdSZS9UEeuj75BOGnG58YJQCs=;
        b=Dour8UnJ+/boPdeiYzNOsutkwVfeN/B8s1WKnu1nUCerFREo3AR1BM3cDUJOXZq270
         VnKze3uULfluu049chsf80tnR1M6xrDxfQGFxMqrkwfwP7FmaCyimO/eyo9onPAh9kkm
         jDoUHTDIw6aPn6/uu7+0lv9HgywTVqOwocixMCDsz7NGQZyTV2DzLACapfIubD61QKDG
         lEh0Qjs2rOUw9wmXzt246vR/EWj4sBcSFvB509kfm1pmUS3sXfzi8vDw4jlic+tA68of
         /+qFoxzudoCoEBqVs1vFhoVitaVYTrQu1yJLOZNpl9p02V2DjSpV9lpC6hNnoW/x2oso
         Uudg==
X-Forwarded-Encrypted: i=1; AL+hErHFSSLB5njUge9Z4/QWXUv7ZezBAUeWMrfofk8SMlHxQQRSix6mwSap5qD88xHx3nlJGtqETmuCtpbGPQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+5Ii4zmlBsddWCBpm87xJZul4KGzldSOUGbyYldCm5kI76a6J9
	SOBOuYzRuH70rYBZztGpwrumTAXjfNCs+NQ7NwFwTvitwbRrU6dmYjU3
X-Gm-Gg: AZFdTZcmNP0AlIRwE51WzM3e5zaPwi7gki6gq72mLmD6x6wFH7jb6nQGtrsigkgBt2J
	I0xz01QpPB3YueunymkB3/Bzwx4KhoASudT5kSFjksFnTjy0zI0AJKHzGEEEH0lW399y9StrMw7
	+RLSaFlE+a6JrFsFCIuWG9bgh2hd86AK4D5KJ7KFu4OpUUDplqt3NnLOnnAYNXyz9S+nfWCxne4
	fNfQByEhuOQWlkYr1VhLtisGnQBj/tCP5O99revlEc2Aq94AGMf5MHIg3mysEA0m76MKnk1rquU
	hy+zOYdv5hyreBbAxXD02kwlcRl3vET70LatI/nSQqfQPtuy2pi/QNLGAMdTDV3k6AntVpkX5Is
	8NwS/JN6bEEVIZc154+vExvgcIpM509/Vk3FoExwg757GW+I+nedjI62KmVjrjHU6RLQKVWbp65
	aB3wockZBlvVcJrJYQrmfEu1gVb4wQkO5Xpt0uMbQLc9IH+785aU8ZidKYaaRl64xroQkaZV42g
	+aqp3EnhboN/bQlqhgRQwGsoReCFSFBJMG7HAigyzPqMdyCIqz+UPuEaVEkmh/GtYMSgHsAEhbs
	sSYcMut0AztQWyI9xAi6vhrC0G0c6T3jFrary9vDS5XsuXqzPKI=
X-Received: by 2002:a05:600c:37c9:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4bb888251b4mr232152425e9.32.1795466049774;
        Mon, 23 Nov 2026 12:34:09 -0800 (PST)
Received: from unknown.local ([151.34.53.154])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm515946805e9.13.2026.11.23.12.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:34:09 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Date: Mon, 23 Nov 2026 21:33:53 +0100
Subject: [PATCH 1/5] media: qcom: camss: Don't stream sub-devices upstream
 of the sensor
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
Message-Id: <20261123-b4-ccs-imx376-v1-1-2b26850a6f11@gmail.com>
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
 David Heidelberg <david@ixit.cz>, Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795466045; l=3624;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=0Cz0qn0VW15LMMWXLllItkJYlosLYSu3ppAkBWYN+0E=;
 b=TYQR3uZ0JKNjjuCaIe/VTJRQvP3xRFLWYplEX4zBGUU1wNIBU22W0RXaFbVTKX689Platxtbd
 SSsPUfocmrCDCd0Et1KHBXKfdNGLdxFoh+XhRydbOr2NydckOtFuRjh
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

video_start_streaming() and video_stop_streaming() walk the media
pipeline from the video node upstream and call s_stream on every
sub-device they find, including every sub-device behind the one that is
linked to the CSIPHY. That is fine for a sensor that is a single
sub-device, but a sensor that consists of several sub-devices gets
s_stream called on each of them, not just on the one that is linked to
the CSIPHY.

The MIPI CCS driver is such a sensor: it exposes a pixel array, a binner
and a scaler sub-device, and the scaler (or the binner when there is no
scaler) is the one linked to the CSIPHY. Streaming is started by that
sub-device and covers the whole sensor. Calling s_stream also on the
binner and on the pixel array is at best redundant and, as the CCS
enable_streams operation only accepts the sensor's source pad, makes the
pixel array fail with -EINVAL, so streaming cannot be started.

This is not specific to CCS. Other drivers that have a sensor on one end
of a pipeline, e.g. ipu3-cio2, rkisp1, ti-cal, ipu6 and rcar-vin, start
only the sub-device that is directly connected to them and leave
propagating the start request upstream to that sub-device.

Do the same in CAMSS: after the first sub-device that is not part of CAMSS
(i.e. the one that was bound by the async notifier, which is the one whose
host private data points to the CSIPHY), stop walking the pipeline.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-video.c | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6f1315..71ca16f15dab 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -249,6 +249,28 @@ static int video_prepare_streaming(struct vb2_queue *q)
 	return ret;
 }
 
+/*
+ * video_subdev_is_external - Check if a pipeline sub-device is not part of CAMSS
+ * @subdev: Sub-device in the pipeline
+ *
+ * camss_subdev_notifier_bound() sets the host private data of every external
+ * sub-device it binds, i.e. the one that is linked to a CSIPHY, to the CSIPHY.
+ * CAMSS sub-devices never have it set.
+ *
+ * Streaming is controlled from the video node, one CAMSS sub-device at a time.
+ * The external sub-device is the end of that chain: the pipeline upstream of it
+ * is not CAMSS' business, and the sub-device is responsible for starting and
+ * stopping whatever else it is made of. Sensors that consist of several
+ * sub-devices, such as MIPI CCS ones, are not expected to be controlled
+ * separately for each of them.
+ *
+ * Return true if @subdev is not a CAMSS sub-device.
+ */
+static bool video_subdev_is_external(struct v4l2_subdev *subdev)
+{
+	return v4l2_get_subdev_hostdata(subdev);
+}
+
 static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct camss_video *video = vb2_get_drv_priv(q);
@@ -284,6 +306,9 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 		ret = v4l2_subdev_call(subdev, video, s_stream, 1);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
 			goto error;
+
+		if (video_subdev_is_external(subdev))
+			break;
 	}
 
 	return 0;
@@ -325,6 +350,9 @@ static void video_stop_streaming(struct vb2_queue *q)
 			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
 			return;
 		}
+
+		if (video_subdev_is_external(subdev))
+			break;
 	}
 
 	video_device_pipeline_stop(vdev);

-- 
2.56.1


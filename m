Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.42.129.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631523;
	b=Hc6A+0m6Hm7PxJr7qiNOlhgcDaJDNXt7TzRKNN1MRE0PIaQhnmZ5hUikc1kg1kF/EWe/
	 rzhRyBwQRlb2TTloOYLDO4ssbaduMbIivO9qBsEAo12nO5EqmKplJOJXxbZv/FkU4VM0U
	 Ss/n5uhdaPzBUH1OrGuFv4bu89nDYpMMc2xco10v7LO/AJJJDf/Oo8OUBO0C60ZmsNSD9
	 WqD/5my8zxJ0o1NooSC7DCyT6JS0twLBJxZ9jlQMQfEOVmD6m1+fgHIEFRBj5ts3WsQZ+
	 UGWoRznxeYOKtT4tmu6NAS6AvczIBk6Eddu485GDnILpUICOkA9KuwuBe4zn4wZRarw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631523;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=S20BW9Z/7VvXX4AsZLkPiNnBx6EdUHqcwU8r7UN+c8I=;
	b=tWiRQm4/GTwxB6sbabjCBlkL48qaouzUHu2SLruhUlmXN6Gr+JzSv//qxv1eKLfncDVk
	 VGuIjbrh/MChLtZALFyNxVLQG8oDb4dyvDrPCVnS1mQajGzBOnXDWWfkhCm0qilfDxW2Q
	 0MufC4i5WulnO0xVeRTXadY1C1gXTF0WeKx+GGz8Krsp43NIizq0OU12DGs/K0nh6Vq1w
	 doFKKHQhdB7mRxfOjQNYeKB89EAhk/K9UaQlOCUv0vleh13iYyeFqgwJQaCL1PnnAb4DS
	 Qs13Z76SlO6SdXmE6bocEaQeGz/hKqYscw5kFDVuCD782oU5/i1YCrnhctovlgeXo7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ixit.cz;
	spf=pass smtp.mailfrom=ixit.cz;
	dkim=pass header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=Lo8XJopf;
	arc=none smtp.remote-ip=84.42.129.46
Received: from ixit.cz (ixit.cz [84.42.129.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBAC606A31E;
	Wed, 25 Nov 2026 18:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACBAC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=Lo8XJopf
Received: from [IPV6:2a02:830a:f787:8f00:f33c:cbcd:417b:d2b9] (unknown [IPv6:2a02:830a:f787:8f00:f33c:cbcd:417b:d2b9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 8BD405340269;
	Wed, 25 Nov 2026 19:32:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1795631520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=S20BW9Z/7VvXX4AsZLkPiNnBx6EdUHqcwU8r7UN+c8I=;
	b=Lo8XJopfwjoZFvoKaunVwkHViLUDrAVVhsZReq+SMGa29Zs9w+7eKnivv+5/FwuUfYrGuU
	SmbHUe5z5kPs9SiDY8nNjy/0ITQ98uxNShMQpH19fXUgAx2rscjUT5I5B/HVTbTnCER0XN
	ybYcgfT5MH+M6ERZ/L+G2rOUzg4deeU=
Message-ID: <cc9be68f-fdb2-401a-80f4-dc4fec6b5e3c@ixit.cz>
Date: Wed, 25 Nov 2026 19:32:00 +0100
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] media: qcom: camss: Don't stream sub-devices upstream
 of the sensor
To: Gianluca Boiano <morf3089@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
 <20261123-b4-ccs-imx376-v1-1-2b26850a6f11@gmail.com>
Content-Language: en-US, cs-CZ
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20261123-b4-ccs-imx376-v1-1-2b26850a6f11@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2026 21:33, Gianluca Boiano wrote:
> video_start_streaming() and video_stop_streaming() walk the media
> pipeline from the video node upstream and call s_stream on every
> sub-device they find, including every sub-device behind the one that is
> linked to the CSIPHY. That is fine for a sensor that is a single
> sub-device, but a sensor that consists of several sub-devices gets
> s_stream called on each of them, not just on the one that is linked to
> the CSIPHY.
> 
> The MIPI CCS driver is such a sensor: it exposes a pixel array, a binner
> and a scaler sub-device, and the scaler (or the binner when there is no
> scaler) is the one linked to the CSIPHY. Streaming is started by that
> sub-device and covers the whole sensor. Calling s_stream also on the
> binner and on the pixel array is at best redundant and, as the CCS
> enable_streams operation only accepts the sensor's source pad, makes the
> pixel array fail with -EINVAL, so streaming cannot be started.
> 
> This is not specific to CCS. Other drivers that have a sensor on one end
> of a pipeline, e.g. ipu3-cio2, rkisp1, ti-cal, ipu6 and rcar-vin, start
> only the sub-device that is directly connected to them and leave
> propagating the start request upstream to that sub-device.
> 
> Do the same in CAMSS: after the first sub-device that is not part of CAMSS
> (i.e. the one that was bound by the async notifier, which is the one whose
> host private data points to the CSIPHY), stop walking the pipeline.
> 
> Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss-video.c | 28 +++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 0852eb6f1315..71ca16f15dab 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -249,6 +249,28 @@ static int video_prepare_streaming(struct vb2_queue *q)
>   	return ret;
>   }
>   
> +/*
> + * video_subdev_is_external - Check if a pipeline sub-device is not part of CAMSS
> + * @subdev: Sub-device in the pipeline
> + *
> + * camss_subdev_notifier_bound() sets the host private data of every external
> + * sub-device it binds, i.e. the one that is linked to a CSIPHY, to the CSIPHY.
> + * CAMSS sub-devices never have it set.
> + *
> + * Streaming is controlled from the video node, one CAMSS sub-device at a time.
> + * The external sub-device is the end of that chain: the pipeline upstream of it
> + * is not CAMSS' business, and the sub-device is responsible for starting and
> + * stopping whatever else it is made of. Sensors that consist of several
> + * sub-devices, such as MIPI CCS ones, are not expected to be controlled
> + * separately for each of them.
> + *
> + * Return true if @subdev is not a CAMSS sub-device.
> + */
> +static bool video_subdev_is_external(struct v4l2_subdev *subdev)

Since it's oneliner, maybe inline here?

> +{
> +	return v4l2_get_subdev_hostdata(subdev);
> +}
> +
>   static int video_start_streaming(struct vb2_queue *q, unsigned int count)
>   {
>   	struct camss_video *video = vb2_get_drv_priv(q);
> @@ -284,6 +306,9 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
>   		ret = v4l2_subdev_call(subdev, video, s_stream, 1);
>   		if (ret < 0 && ret != -ENOIOCTLCMD)
>   			goto error;
> +
> +		if (video_subdev_is_external(subdev))
> +			break;
>   	}
>   
>   	return 0;
> @@ -325,6 +350,9 @@ static void video_stop_streaming(struct vb2_queue *q)
>   			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
>   			return;
>   		}
> +
> +		if (video_subdev_is_external(subdev))
> +			break;
>   	}
>   
>   	video_device_pipeline_stop(vdev);
> 


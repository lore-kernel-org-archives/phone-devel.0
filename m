Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD5D36895A
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 07:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773817669; cv=none; b=dILhVEMwMxZTm4yWyt449QyZUwtyBC971t1r2lyuLmm91XNHrKIoSygfxqpU4+PpvXRdOUu/01TLorgiiD1YUC/FaOStFvEN5fFkhlu2tBqpkisS528QtDBtlA9olZdr+jFoRJ7oiAQUfX4K3hTUT2esKSPk1f89LzQpTrkRYOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773817669; c=relaxed/simple;
	bh=rp8gZo/G8CrNdKR5x68aWhcczyfAKdLpo61udB7kUm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmW1l1GFV3VKkY3o09ZqKKNyCh4ezS9oYKnYP0DkvYbqL8KSnUhtvup0lXtusU7g5vv8d6+esPW3aChPEwrVCvFsTDB66G8V8lCjRjd/FBUO3BCBW5/EFNNRQ/ZTF1FdPMsGY78aJqpPEu/wIqINVSc3MPzjvUEh4Otg6pha328=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NjXOlTdO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=beSRX8m/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjXOlTdO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="beSRX8m/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I76YoP2612578
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 07:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i2rdDHXYPxCKAA2XTWkadTP5kTXD3VwNrVsXvmFPi+4=; b=NjXOlTdOE/VXXpHN
	x/QnzXNEbHRVDcuFhg3ogWVkczZIki43BMhs/iR614X99t7njU7n94OSuTtCVhJu
	FiWd/ejgAg7QIlGZx0t2ZDdVr+y5nRnv9PL6FA5GhTosWTQFu5/2gTat797zp5vQ
	6fpx7IBDQ7aSVyMv3Ql5CdlW7qyMwvYCRMStVbr3vbEAwgzcyAy7hFvaIW6pkn08
	86td0hWcXRZGKNDsuyZi5ggnZExZiti+T18mes0kHoMv02M7lv3uT3Arz9WJXZIw
	nCaIIRGl6SUpTx3XBP+MWo9Wo3w7DT6KaDZsFBkYggyDS1JJk15T5Xck8QahUAlg
	gSp4rw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyqcdr04h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 07:07:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50937c5b742so177246331cf.2
        for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 00:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773817667; x=1774422467; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i2rdDHXYPxCKAA2XTWkadTP5kTXD3VwNrVsXvmFPi+4=;
        b=beSRX8m/Iy6G7gSpgqxJwEOlhn0DCRbu+Fldk+Pi7n5h7dZP/RESss4l6tRteYfD7C
         s1gGwod8shCqflZL4PVMmTlqsc3HkzpSoYw67/uvCYcwtpl0msB/OvGvMkcRQdr3MqAJ
         VDU3WXH7Z9q7DCPA936at2bylYefdfo/qWHt27UnIwb4EwoYIidhFIJdmX+sOkyYmtKM
         2KRX1HDek3Y/ZWArALEObNJoih7FyAeO8NIzvoY4HuVUrD1Q/MCfxvsHK0fO4zzBnOc5
         FpEiJR7rTAsZi+4YyrXdqXQ0Kar/eWMzm+sRGlTxrvb/hHMBs9hn3a0sdNs1MNei5z7X
         jb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773817667; x=1774422467;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i2rdDHXYPxCKAA2XTWkadTP5kTXD3VwNrVsXvmFPi+4=;
        b=O7fjRJli9gUwKRKOdAV2hiOrvfmz6S9gqokl2WWzitAEaodLOOgThvCdFBNQxObns9
         T1j+h2tUAQoJsi2hvo14JeRKJh7F+5uKWEjAUWTNpgPwg1YvLUgDWclIplq0H7+bV2NQ
         ETEhJVPOMQBmOJMqn/EYVEASdwGJJstgjxBv8Hk1abBFDVtqcTzPhfIxarV43D/x0AsJ
         rj8QWk8Rlwe+m5Noyc3/A9ouIgHzF0NGzlwmS6Q0jdqt/9xUS58kHu7fQTdch+Y4AwUY
         hmtnlRp/SgpstIQoQiNiJmFiFLYAqvB5n7evAGGz4c36zAf3X6/DHmE/T++K0UQr+rYr
         p5/w==
X-Forwarded-Encrypted: i=1; AJvYcCWyT88C69kQ7vXmLQnAuUO7wnRdWeuqAtcL0rCaFQXmb4JApFHgRCM1Trwa/5sb2WU17GvDdHti6v8Plg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgS8UHT+jopCWMweK8TuBsstjptvJbt8f0LAjkwYNs6X4jmWtn
	bjqOx97uEpiMhR4Qkjp1lFoMiYUGtxzgHZ+mEke0yJVyPoAOnBRKlT6xuGo30sko2miDawHZQ3E
	n/Lw8Hbx0AU0XSA3FxBJTiHAzwKy5beSSWwwIg2IZ7MsQtkp99mgi8dpIw3+aj+TFxA==
X-Gm-Gg: ATEYQzyG3FJ4pD5ZJplZhxW6c/Lyam0h+Gb0CZDkvI6FSpws0SfyZxqSB2tnQJY1VB9
	nQXRfxHFs9J1Yp2d7GNVvubVYyr/r5dWdg7B78wndbW2tdk0+e3G5A7a7KQxtNjpAifnQGh1NYy
	CKoZ0UTHceYyTKe+CR3pst+snp8D21kZAGt/2bMIJr9WUgK97glIHAXlgkmNNwBgYsRHs+PgFx8
	2Y1xIsKcB09FC00Dv1p6uGN7PiqmoaO61BhEwQIHvGFGPetv7w0vj5eh6gFpbB1MdHegBKp18Zr
	YsIZvMwxtxnBLEWL68aTDrDN0XCxFfaTbrn3jCyKglqfBzHyYyUOITzOQd0a3E/K3gu7F0ymsC1
	0T/AdqMbPE7/fqQ7aZWJPTD2ELYs1l8fcACnbcYpBVV+2ORM2OwQJdwH1TmYVZjRjeyFZBNBYMp
	jqAeFonaJ/PDXRb38AkSKumZF++8HgK6m1S3M=
X-Received: by 2002:ac8:58ca:0:b0:509:35a7:2e57 with SMTP id d75a77b69052e-50b1485db17mr28670081cf.38.1773817666708;
        Wed, 18 Mar 2026 00:07:46 -0700 (PDT)
X-Received: by 2002:ac8:58ca:0:b0:509:35a7:2e57 with SMTP id d75a77b69052e-50b1485db17mr28669771cf.38.1773817666170;
        Wed, 18 Mar 2026 00:07:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd54bdb39sm3914501fa.33.2026.03.18.00.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 00:07:45 -0700 (PDT)
Date: Wed, 18 Mar 2026 09:07:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kamil =?utf-8?B?R2/FgmRh?= <kamil.golda@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kaustabh Chakraborty <kauschluss@disroot.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 2/3] drm: panel: Add Samsung S6E8FC0 DSI controller
 for M1906F9 panel
Message-ID: <toypfgi5hvyficlcjqcqal3soprwhwni2ypqg7khjniekwxv6s@yelffkw2tjzu>
References: <20260317-panel-patches-v5-0-ef99f7b280da@gmail.com>
 <20260317-panel-patches-v5-2-ef99f7b280da@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260317-panel-patches-v5-2-ef99f7b280da@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA1OSBTYWx0ZWRfX/YlrQV9g/dBZ
 f3lUN6K2fBK7EL2I4E3zeEnAUt0llJ/12XQHktWrSAhKSc5EY3TmjXnmi/9EDoG9KH8T/5i8dir
 mt7odpx1wUI/3WGFFUPOlFB/i6p0i6oJbtvhtDd+jtw7ZNBVN0qmIeDnfMwHV2jH2hyFKsEjqjZ
 7AP+PvQnnw4yKEQXiA+kuUqPVHafSCHCaCflc4sNqMaEBDQ3rkH0Wj+Ih2vuYQa+Zj0PWYljk4s
 xstN+bvhTstob8f9qz+P2raKIlA25eFGWuZ7mImNHFg416RotsxHRenAN4mQnj6nx5BSohj7wKk
 30yU+slqlDlaB9mCOGyM6KnoJRGLijhme1XtPpQvzXRc765WzB0dR7JwnYRtOEpBVcOLkkXm//D
 gSu0/GGGk7JB3vzppYeCpZtiMDY4bY+hTB7rBPM+eKuw4qZgyz3dX8C16SBt8NhpykKFSo0Rs5w
 /eHBk6/zb91lM5RESVg==
X-Proofpoint-ORIG-GUID: obGGwBpszS41w9VVztZzzvUsl0j_HoAg
X-Authority-Analysis: v=2.4 cv=H87WAuYi c=1 sm=1 tr=0 ts=69ba4f43 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=sfOm8-O8AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=8s1cotv8QL1OgUCTKcIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: obGGwBpszS41w9VVztZzzvUsl0j_HoAg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180059

On Tue, Mar 17, 2026 at 08:50:30PM +0200, Yedaya Katsman wrote:
> Add driver for Samsung S6E8FC0 DSI controller for M1906F9 video mode panel,
> found in Xiaomi Mi A3 mobile phone.
> 
> Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> 
> ---
> 
> The downstream dts claims a max brightness of 2047, but seems to ignore the
> MSB.
> ---
>  MAINTAINERS                                        |   5 +
>  drivers/gpu/drm/panel/Kconfig                      |  13 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  .../gpu/drm/panel/panel-samsung-s6e8fc0-m1906f9.c  | 301 +++++++++++++++++++++
>  4 files changed, 320 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

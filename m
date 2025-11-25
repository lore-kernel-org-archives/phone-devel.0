Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966CE314D0F
	for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 10:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764067553; cv=none; b=qVEW9st0oREZz4bCovf9tTl/83I5u9C0i7x/aLj6EQVecxx6vPSIKs9cFAw+fM1DMkRRXhnB/eCZHXkAUQY1I1Aa+GX5a6wyU7fKtt8tAs7KfkhhqKeuI9YNJbBhSXhdq6uJ726uLNrAxZ9Qe78XW1FXgdYJFNNIYle9Vc95UB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764067553; c=relaxed/simple;
	bh=+BqqpBFcfJv9LiXUZyvYPW0MnNdqhGc9+zw0MiBReHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGXLLynA+SAVY4gY20HV+4ZqqYiEj/26M37hcdJSPotr3FGcIqltqOQnN8Dkrm7hIK7SOo9cvWa/SlAjiZJM3MAqtT1/SKRrbqiI8LdygjSSKOh5lc46VKdakcrztFWGTLZgPc2dy9Y8sA6xPMw7/3RGeHwogN4qiTGuGpxGda8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S4hGKNN+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSmuPzAO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S4hGKNN+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSmuPzAO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9ZqcC1233477
	for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 10:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=amvjrNRrfVqIzHSIYmyRllhF
	vfWonHWIq2wkK0wmVak=; b=S4hGKNN+rgJ9w+E1ZyX58lTr8nh1yVANR9SVTBWu
	qdcBSHUJ3c+/A3wC6kFS85lUF9891omS0tXHdHUM17y6PeZwBTY0zEqU2ARw1JIr
	exLuvQtmiRoiXc5Y+M5SXS9z6ro1PWuAl27pDM1IJlp+Pz7WhrwdvgNf7tcNwaLp
	8f1LB7LR7RYPCm+RdL8g+ddSAd/79567b4hEmDYx0Y+w5SBHzB1xQRFUuv+w/T/0
	yg8P4Hrf6tDHTXS2zNMgl4gLORcRwlSzd5hzQTlFWzYXR2hqSTpa2aTtj2kTcMeT
	pMp+uPLH6YLySVnYqTifVSAeGf3jGJmVbE7mGRaoPemslw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an0xyhv1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 10:45:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3437863d0easo9509315a91.0
        for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 02:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764067550; x=1764672350; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=amvjrNRrfVqIzHSIYmyRllhFvfWonHWIq2wkK0wmVak=;
        b=aSmuPzAO9VN+ivNJHxVc/YQWMqE1pBk0G/2J5QD2OeppcJqN6RirbK8ap1jD3p9QXc
         +uJ3r1ybXQrHC0wdtTKETJI2zc2CtaPsEgWjm/Z7y9JdwYNu+Kf/pjTiha/QGHYEj3Zb
         lgH3AGnqdshoxivzY66UVH0qM53CWZkNRZBe0Eq9eNU8885P/5V2hwrJY50keHOyGmp5
         aFgbuS0CbKqOatj4ges9YWqlSlHG5ZaOQ9VXi3Us2jl/IJ47L0GeQAQy94GZk5YdxDAD
         0OLwjgpESWhVXcZwCe15t/y8UvB6tvMafHofSrEw/qLOOkUYQzqiOw2tMWB6/00ESsjS
         q98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764067550; x=1764672350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amvjrNRrfVqIzHSIYmyRllhFvfWonHWIq2wkK0wmVak=;
        b=MDpaNxYPqzZAXxAWXfSr8ISgX3IdVCH9l2JVFNqZ5cBAdXeDlsBYf5BiH0TXUMkLp5
         K7XTBivyByzYlfGYRM/5BhxvYrLrSCJ9nwloj71UrZKMI59PguQQ5J3Gl340dObxWoI4
         jAZsqdikr3enk1fpXhC5EnlY/asvQUSHQPwQR/K7DCwGKdi9vNCRrFIVePI9n60vv3/6
         3UduBNUXtn7DtaRyPfwatCg1O8PgiiXxabELWH+FFutN1oMPZrOfIPVTP9OJC57JJ9u/
         Se6LJ3ZiGlL+7aQ4okZB3AT2Q1anvwPj+tZlQpB+vlQqQXV8xunxj88yfFveplmP91Q3
         jATQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8SKXN3j5VMlZ6d92yBg0cxMfBfmEG8ScdgkJd4eu/aHTKHYG6UV9OfCtVitMKKpGMNQVZVb4SN2XHjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiAOGktdE5oObkP65oaJe7eWV/QYPjI6a1dzobfnofML0ol66j
	v49r9y8s7phcvFOxf2DLJtVijjpi2QYhmoBSwHrngfzTr4sCbZEqli14OyWHbHpuFmmISvhIHCf
	bQqbdv5RKvrGN67KIPN9GP7qeS5J0h35rSsc4Pc3XLL7FzN1p2P32NTsp9+9lfUrvWg+b93NnPv
	Yr/hGCNm7ScKPL/wSI68mnNljDOP6pIdIrCmIy6JIg
X-Gm-Gg: ASbGncuRuJm6AwZL6dIh6NQHAxl6G2LQlohYHbH/y5nd/WGQmi2hQ0vUWayI54MctBw
	uUCuw6qzlUX9xboQacz3ai4xF3MCd5D4ATVKKoqdP1USECt1By5g6/qPMGS86ZmfpKuGJcH3LKH
	oQz+Pk0CTcMQLWYwumKTKzzr7Cut/ZgfwowsPajCsk5ln/jcHFkfJalKvT74K8W5MZs/l0iE6GZ
	sUlg+MD
X-Received: by 2002:a17:90b:270d:b0:340:2a16:94be with SMTP id 98e67ed59e1d1-34733e5524amr14722196a91.4.1764067549920;
        Tue, 25 Nov 2025 02:45:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGI094azFzHmR9Mpqh2BRxwu+hIt81IHtiK5UwJ5+gq9ntEsPJXOl2awVYN9lA7/mn4pi8WZXMDuGhgAdl8pSM=
X-Received: by 2002:a17:90b:270d:b0:340:2a16:94be with SMTP id
 98e67ed59e1d1-34733e5524amr14722162a91.4.1764067549382; Tue, 25 Nov 2025
 02:45:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111-xiaomi-beryllium-firmware-v1-0-836b9c51ad86@ixit.cz>
 <20251111-xiaomi-beryllium-firmware-v1-1-836b9c51ad86@ixit.cz> <313b36d3-e1b4-4e80-8d5d-d65981abb34b@ixit.cz>
In-Reply-To: <313b36d3-e1b4-4e80-8d5d-d65981abb34b@ixit.cz>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 12:45:38 +0200
X-Gm-Features: AWmQ_bnWmBdFq8y-6AhUdu26riDbJhJiOAevtOgo1n9d3y03_XHjZCEBqAIS92o
Message-ID: <CAO9ioeX8hCn3-SQ3etvCT5OfNLRmbqZ6DQg_smQO6PugEg_5Yg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ath10k: Introduce a firmware quirk to skip host cap
 QMI requests
To: David Heidelberg <david@ixit.cz>
Cc: Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Joel Selvaraj <foss@joelselvaraj.com>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=S+bUAYsP c=1 sm=1 tr=0 ts=692588de cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=1U8LozzuH-I-QAyVdeQA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA4NyBTYWx0ZWRfX8Oz2LmG7Kwn4
 oTGv+BsshwzpxzQQX/bG6O1gdOqlX0CJTs1YMLhZi1ZQQ1tQAp0eF/V94huTHHQipD5V4lLc6Du
 7ly4O7s4smYLKthv6yL5jw8AzYfnWgQJ20bGqzgGFMnp59DhcnjSDY7HlriCl3SE9A6I5TKfdb2
 4RH5/xupRKRxtIFzR6nK2r/XQ/AmeyMM1uDdzpvYWxWDkZIRZ2EC8bKpdK1wJvtLAGLEKu2Cio/
 LuJd47Q0/Wi1ifJM5KvXRKyIZC3IWvB1IqEMqNteVJvZiWoj/crxcXJO42yWavIDHd5ghORA5rl
 eYMmu7fPFL88WPJfNkjaGUDf0euDf4wD7lojLapLOK+aMFiqPq1OP47kmIeSOkon5e/Ek69x8mg
 7+esgfOtHEK7S7bfgpegTo1TkekvRw==
X-Proofpoint-ORIG-GUID: IdBl1n0Pn-e-PciP4tb2EaR1p_rkuDfc
X-Proofpoint-GUID: IdBl1n0Pn-e-PciP4tb2EaR1p_rkuDfc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250087

On Tue, 25 Nov 2025 at 11:27, David Heidelberg <david@ixit.cz> wrote:
>
> Sadly, this is too early in the initialization process and we get NULL
> deref, similar to [1].
>

[dropped splat]

>
> If no objection raised, I would go back to the original device-tree
> property way then (as also another device in need of this quirk showed up).

Please fix the NULL deref instead. This is a property of the firmware
rather than a device.

>
> David
>
> [1]
> https://lore.kernel.org/ath10k/54ac2295-36b4-49fc-9583-a10db8d9d5d6@freebox.fr/
>
> On 11/11/2025 13:34, David Heidelberg via B4 Relay wrote:
> > From: David Heidelberg <david@ixit.cz>
> >
> > There are firmware versions which do not support host capability
> > QMI request. We suspect either the host cap is not implemented or
> > there may be firmware specific issues, but apparently there seem
> > to be a generation of firmware that has this particular behavior.
> >
> > For example, firmware build on Xiaomi Poco F1 (sdm845) phone:
> > "QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
> >
> > If we do not skip the host cap QMI request on Xiaomi Poco F1,
> > then we get a QMI_ERR_MALFORMED_MSG_V01 error message in the
> > ath10k_qmi_host_cap_send_sync(). But this error message is not
> > fatal to the firmware nor to the ath10k driver and we can still
> > bring up the WiFi services successfully if we just ignore it.
> >
> > Hence introducing this firmware quirk to skip host capability
> > QMI request for the firmware versions which do not support this
> > feature.
> >
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> >   drivers/net/wireless/ath/ath10k/core.c |  1 +
> >   drivers/net/wireless/ath/ath10k/core.h |  3 +++
> >   drivers/net/wireless/ath/ath10k/qmi.c  | 13 ++++++++++---
> >   3 files changed, 14 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> > index 7c2939cbde5f0..7602631696798 100644
> > --- a/drivers/net/wireless/ath/ath10k/core.c
> > +++ b/drivers/net/wireless/ath/ath10k/core.c
> > @@ -773,6 +773,7 @@ static const char *const ath10k_core_fw_feature_str[] = {
> >       [ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL] = "single-chan-info-per-channel",
> >       [ATH10K_FW_FEATURE_PEER_FIXED_RATE] = "peer-fixed-rate",
> >       [ATH10K_FW_FEATURE_IRAM_RECOVERY] = "iram-recovery",
> > +     [ATH10K_FW_FEATURE_NO_HOST_CAP_QMI_REQ] = "no-host-cap-qmi-req",
> >   };
> >
> >   static unsigned int ath10k_core_get_fw_feature_str(char *buf,
> > diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
> > index 73a9db302245d..b20541e4046f8 100644
> > --- a/drivers/net/wireless/ath/ath10k/core.h
> > +++ b/drivers/net/wireless/ath/ath10k/core.h
> > @@ -838,6 +838,9 @@ enum ath10k_fw_features {
> >       /* Firmware support IRAM recovery */
> >       ATH10K_FW_FEATURE_IRAM_RECOVERY = 22,
> >
> > +     /* Firmware does not support host capability QMI request */
> > +     ATH10K_FW_FEATURE_NO_HOST_CAP_QMI_REQ = 23,
> > +
> >       /* keep last */
> >       ATH10K_FW_FEATURE_COUNT,
> >   };
> > diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> > index 8275345631a0b..5dc8ea39372c1 100644
> > --- a/drivers/net/wireless/ath/ath10k/qmi.c
> > +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> > @@ -819,9 +819,16 @@ static void ath10k_qmi_event_server_arrive(struct ath10k_qmi *qmi)
> >               return;
> >       }
> >
> > -     ret = ath10k_qmi_host_cap_send_sync(qmi);
> > -     if (ret)
> > -             return;
> > +     /*
> > +      * Skip the host capability request for the firmware versions which
> > +      * do not support this feature.
> > +      */
> > +     if (!test_bit(ATH10K_FW_FEATURE_NO_HOST_CAP_QMI_REQ,
> > +                   ar->running_fw->fw_file.fw_features)) {
> > +             ret = ath10k_qmi_host_cap_send_sync(qmi);
> > +             if (ret)
> > +                     return;
> > +     }
> >
> >       ret = ath10k_qmi_msa_mem_info_send_sync_msg(qmi);
> >       if (ret)
> >
>
> --
> David Heidelberg
>


-- 
With best wishes
Dmitry

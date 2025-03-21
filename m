Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D77E22AE59
	for <phone-devel@vger.kernel.org>; Fri, 21 Mar 2025 17:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742577648; cv=none; b=rVb0EZ7MXcCvxPlH7sI/xT/vRvbf2H+YTFtOz9zANGakBDZWoKgwSTi4QctujMbKlrM6LIoOZdMXrdE/x9Kl3+wGlIIX68EVKXg7AVu8jPvM2hF44EnnM4upmNVWfr39uYL8pZDUdqtT31ipk01Q07+cUPENn67v34ma2NBy2B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742577648; c=relaxed/simple;
	bh=qmKoCAZRoRbHTTOKcO+4PVhKdKeMHGgyeEZ3jlFoy9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bUnn1XQej6wae0UfbHooLQ5MB7fLQhzB3pWrueHyYC4tJf7tFqgvKx+MgKHl1KQL++rgyBrt2TZsy8Vo3/oiCxhkMRarczRaPRA7DcTVzXwAsQrhZ5KRfv6b68724AiFH7zrVzGYfQlk1tNUmt5GJX6I+oTQVjqMPVTW/G3ZyOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkhnGGp4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkhnGGp4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATBXP015008
	for <phone-devel@vger.kernel.org>; Fri, 21 Mar 2025 17:20:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uDTpwkPptGdzgbOoxDa8xyDZ
	cduGG5xDhf0EsIsjkOI=; b=dkhnGGp4E36ZPnBzDW9+hVc9fAjGmC5BU860RBm+
	tqmgwsd3pznlFpM5KMgCzG4LH8WN2QOiUj3Ka+fR7uUSB5O4adT7+rVbvjfIWivM
	QfxVz05f3Morlm8DScJyFJMTpuqASsj4lN38RVYxnyGDle+1RxLff7UYYdNMHioh
	FVz59BiX5bQpV0IOEog0kDxHQgL0kKhhIsIYGSB5sNBytRC3EnAeaRtAlpKCJyO9
	y3sF3tv8cnvxbSVfML3YjZ2RH5A0N8q5Wxvr9sIKDp2YgpgiTdSk/nYsfC54o8as
	z5zZgEKLSJWuu5OBi7IiR9X9agyfBVTP0fT94FPIIS7sHQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gbngnqn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 21 Mar 2025 17:20:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47693206d3bso50420751cf.1
        for <phone-devel@vger.kernel.org>; Fri, 21 Mar 2025 10:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742577644; x=1743182444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDTpwkPptGdzgbOoxDa8xyDZcduGG5xDhf0EsIsjkOI=;
        b=wkKBfZ56WViI9+zoefXiItcrMUTM5v+W1jVWe3shP/lt0FTmAlA0PXq4vQYQ/qzG3V
         7zSW4t7g4MvTjcfZ+FfCZHC7lEMXjUveFnmlzJYI45PKAX/rZQnU4r08c5dLNlu92mH/
         VjNRssovzimauGa2LVa4Vsw1ohz184zOXnhXr6h/XehSD19YJZrJoCb7+LAazp2DZmeD
         s5ENXkeHUK+DAoZDsyquwyNi7RJvVSrEFIV+ujqDkCjNDV/lE41IhRpU1nAaTl83nMnA
         +2f+3uw1PJt3lydoMER6w9v7Rycwy3ht3badN5dLmsCJY6AyhAnD5/MGi/AAaFpc6R8d
         Q6Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUKz3BPjQxTs7ygEhlxtuevVH5kuN9V4NiiDfgxTSir9bVA44iUcoypp+sUvHCemQNeox6CG1FL6CRu4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YymUQRiAGTbhSsUZk79LtOHEyhJCR6MbUA3bKxo0oZJJfIJYUW2
	vX1KKXi+2Fn1g/iBQX4BgBaOWuCqojkIvevE0hz88Eb2L53IecBNh3viJNvkTfsApLI17u1uBa9
	2EVS1winX9ukws7m8h3Yt3Vpak1v/2OJicCXy/Bo9UQ3r8j7MhIdqMapgz7UVpQ==
X-Gm-Gg: ASbGncvXAbijqSTE8UACufJA9yQDo9ViZCVena2Nn4lzCBDjkr40GJkiZvvsjbdWB42
	anhJGlgGanGVBR8TbF9gh38n7xyo+Fm5mL5O6YyLY8jNcIBegEfg+T/OUfxEEch3sJF2+4xtf4L
	6f0a2C/yNZOcLDu+D4umREAWy0xrG0qSHNDRgkCvNwl9uKqakQMNCcJ8IaWXHwixf3JIHcU4DwK
	zKB25j0hDhyGT135rNneUFNpnJmwIHiQPMYrS9L8GnPNCmd3CEji1uzV8rIv2H5EOzrFVmwn8zM
	KkWdfDYGc/4G4A+tT19PggunOo2XSzYA7HSUqBSKwRNEGpLXQx1D6mPLNHXG58KxEIWb8JBh7e8
	owqg=
X-Received: by 2002:a05:622a:4d8d:b0:476:a7f2:272d with SMTP id d75a77b69052e-4771de8b4b5mr72699171cf.44.1742577644393;
        Fri, 21 Mar 2025 10:20:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx0VZLa5EFNdEAjuIa1FS+mTNMST/xHfZhUEXNJJ7m5u9qI7CPpdWYXoz0qNcBgm/3w2c4Hg==
X-Received: by 2002:a05:622a:4d8d:b0:476:a7f2:272d with SMTP id d75a77b69052e-4771de8b4b5mr72698801cf.44.1742577644139;
        Fri, 21 Mar 2025 10:20:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647c98dsm225951e87.67.2025.03.21.10.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 10:20:42 -0700 (PDT)
Date: Fri, 21 Mar 2025 19:20:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm6350: add APR and some audio-related
 services
Message-ID: <aglvc2n5acln7lnnsnoyzyxega3bttz7qrzmmjn2atr77xsvph@dpzcohdphgdk>
References: <20250321-sm6350-apr-v1-1-7805ce7b4dcf@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321-sm6350-apr-v1-1-7805ce7b4dcf@fairphone.com>
X-Proofpoint-GUID: FPOnDam8hBGknHlNpC1fGuwMBPliEjPH
X-Authority-Analysis: v=2.4 cv=MJ5gmNZl c=1 sm=1 tr=0 ts=67dd9fed cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=d6hRspmLNtqVbEz1Xe4A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: FPOnDam8hBGknHlNpC1fGuwMBPliEjPH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=880 clxscore=1015
 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210127

On Fri, Mar 21, 2025 at 09:12:57AM +0100, Luca Weiss wrote:
> Add the APR node and its associated services required for audio on
> the SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 59 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

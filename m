Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDFE33123B
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 21:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775253277; cv=none; b=dd/mJtTSVB2uRiMm5oS/3zVTNK0h2PeN3t3+z5B4n7+vnwfZ6osgxNn/ysfbH1m/Wkrm8j7JR32+DlMlijUx01xYw36TwUQt6W7WnXgUaMcfY0ZPQAcB0eoRmZx/gsO6ZX3VEMi3I175CwfhSGYxyvi6HUm1ywM2X3kFMnaWd4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775253277; c=relaxed/simple;
	bh=4PyYqCMRHxxU5QTdFQ2bY9UFxws/ljt2W4NAhD0wt/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m34Q4nCMWlcnXGIPg8B6DmswjkWQSrMt9Zvi7H7tAkTVz/iNfa/q5rzVNu18DrPTHH/MAelnnPbaXc6I101K7X7pdXBhjy7h/YrwwaIu0xZd9lPvPLINIrA7m8KUVOsRFmmw5Q8SVKgMTu6lVFCf5N04xdFbaeVnuDMaDnvhawU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbGcCPnA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PA80ytiR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbGcCPnA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PA80ytiR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633F3WZ13449814
	for <phone-devel@vger.kernel.org>; Fri, 3 Apr 2026 21:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y9zedheblneIseqLyTu54++r
	jDJmuqlr324tiZu2S8c=; b=SbGcCPnAGCPNv/biaWHt9nHjaT5RCB4GXbpDrmi3
	EvWmYPFqdRIwO8pLUp3d6blQxLEiTkCn8520ia4PhWa+W7cQXLWjKqQWmFdXAINY
	J/VJeuwvru95PT2hgz2i1znNjyQetlACoMbXNkl9jYLXEV5hDQiHK+pXhAxplK/J
	NXfMKFOzP/leBf2NYPOrzoiKWv+v0d5AFyGOr+kLoMffEn1iVgT3yLgp0sLeBtng
	2fZXJi+eNlKRmOOnxuo6PAsGcreci7PhauKJcUMgy89+GDlMIWrGFT0BUUnE+kZU
	WNip0hAzGLj9+8rZibY22ENbLSA4nCyP8qyGFtZwK8JJ1Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da8u5abb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 21:54:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b6f869676so53193911cf.2
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 14:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775253274; x=1775858074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9zedheblneIseqLyTu54++rjDJmuqlr324tiZu2S8c=;
        b=PA80ytiR2JAM4Gs408LRoN/NVYo4lX0iVGdWchgt2w+OafD/UwF2VgtjEeyrLJ9/fn
         s/ghR2i/sA6LFf6rRBSEU/ia6xt9pe7TMi3tDFo7R8R8nZgi8pqgHDSAMWVribqhZdKw
         ZfmHCg4uFGOMdRFr02kakeGjgks792hiEvIeqLrBgVB9oyONnIMqJqW9W7mMdShd8XEP
         j4KZIAMlP61xKHSQ3h1vz3us6aNKUS1A98vK30ALqtVImgJaPzGo52tuG2zwPtJH0ZSP
         kNfaPtu+MLpftDZUkpUpH4CTCoKdnxx63YQ5v8j+0kUs7nyivuIqVn2opiC1BZPBUZ8I
         Ovhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775253274; x=1775858074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9zedheblneIseqLyTu54++rjDJmuqlr324tiZu2S8c=;
        b=kwAmMIFQlrw9Zi9tjCMQEbTubnNsas1BHMINjpcMz+/1P4g3ThLRYAs5ZXQ618A4cl
         PCYjSmgP5IKP8xxdoj9ZDc87TBxmA2SPymv8SGtSZ/2n5W537l0QyHBXpUei8r2MoQRo
         3FrH0WVh2zP6SDg/D4YeUbRhALw3ktx+4+5B+/3hgK3fRwGhc6RDlFyG+eUGbRSxPtxy
         gGJw6Q8MlLh7Qw63RbzS6MCs5KqCzeN9+IrIISRYjfjsyyCg/NyPusZfDb9YMdJuqLO6
         0ybO5PEYGblS5wdR44WTTYAaD8IN89xTU6UDyrv1NJ4S28Hb4qI7x89fGspuuAO2thqv
         o13w==
X-Forwarded-Encrypted: i=1; AJvYcCUQjUR8eeshMIkBaM9b+XVU6kfSwUvVpTzxI7HWQ91U8V4ITgWn05kToqnI7aoXUlSTc5TBpXxWQoKtSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJpErQlwtyZsQWnK6Su7Bh534BjB31T/niWua3dIl+WE8fQTVy
	4n2dsu6jfg/42zfB3Hys5AU2JU+345wAmS3l2dmb/8rbjC6dKhijAxw3Kae4XpugZmNjm7OQn5b
	rKOo2lkzY15j9vWcbdNgBNh1ftSlofdjcQcnVG+paFt+fymMltnlPrX2SAsen7VPZSg==
X-Gm-Gg: ATEYQzxoN322ixUxBvJrAiGTyXI1iMe9IW22MXFP+ZKsJD9vSGmTy1KWXuWKfvn442U
	gKSzsuo9KPAvnBzmcZv14/VVTTk0SXt9AwEoyEnHke3kqHKaC72HgO0CqRJ2z6RH3Xd/0eLkCgl
	NAhz5h2KMvURuLWsHXmAbC6vIpE2zqWttLGUVcL5GB2jeFCDcPVgRc6IJ1sETfcJfUzqKEeOzKC
	hPsDK1rbygPFa6iRnnli3JMqFHUv2RMzWiCWxWV5S0KDWXHGZiiy95MPUMAmMqcFKlsjZ5fdmDQ
	SMH2plRT3eUc2X/nChuWmfw+vPsS5kiU4ht5a1lrufCvoERuuH/a0A7L7WCJdcy2aXcgYzTdOiy
	KFxFWL00CYlX5/RMnLjkq1KA2vtTNqOJYK4EfEXO0O7DUC5wLeRYLOFCRv5wupTolWDhhJwxQii
	X8GtZw7R3qkRwfqsDHQp58kZ+DH/koClpI5NE=
X-Received: by 2002:a05:622a:790d:b0:509:20de:4ad1 with SMTP id d75a77b69052e-50d62614c30mr58337981cf.10.1775253274030;
        Fri, 03 Apr 2026 14:54:34 -0700 (PDT)
X-Received: by 2002:a05:622a:790d:b0:509:20de:4ad1 with SMTP id d75a77b69052e-50d62614c30mr58337691cf.10.1775253273514;
        Fri, 03 Apr 2026 14:54:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ca32ccsm1714618e87.37.2026.04.03.14.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:54:31 -0700 (PDT)
Date: Sat, 4 Apr 2026 00:54:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iio: adc: qcom-pm8xxx-xoadc: remove redundant
 error logging in pm8xxx_read_raw
Message-ID: <35urrjc3koye5zhlxatdsr7t2djuml5ueyhhazcucow3q3g5f2@pomnrrcwu7qr>
References: <20260403-pm8xxx-xoadc-label-v2-0-29b50bf821e6@smankusors.com>
 <20260403-pm8xxx-xoadc-label-v2-2-29b50bf821e6@smankusors.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-pm8xxx-xoadc-label-v2-2-29b50bf821e6@smankusors.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE5NiBTYWx0ZWRfX9Jc9g+Wgmbb+
 T6lbgr8jL4c2Y6OQc1Gl0L/qhJU1T1Fv7kcfdf5SR1j+dpq2l8OOOvATAhEYyehqaOTg3DbYw/Z
 tUYuxWOtmWbLZ2MobStZ5frxA/N2603M38gmcX+f5312K5bVMxX0DtIe41Vmi27LHI2oKM6go+8
 wn8kIDLNyof6+ql8YP6LYfbaqd47YFSghpkonc1mxdqIVEq0c7Q4VGNNSgh6qL7u5L/yM8Y8Ikd
 2EH2gskVCfAH/P7/WrWx1+yyole6U9fmWMc9hixeHc8X9VcmbgXkkr7JB058h3XHhwT1b3Jt7HX
 UeEW8Xga+pY0+dsj2u9WyUsb5W76gPzWdDqybq/64n9x3Dp3PfNxTxSg4vazY1RVGmnE7XHBkwn
 dk89KLAdKzycz70VwYTJlX3DLLyY55Yq2DdqY9zN7c8pzjPOfgZrv0Jtwtgi6K42Ca4n9r9Kd2I
 qHdN8hl25m/KVUbZ38Q==
X-Authority-Analysis: v=2.4 cv=W5g1lBWk c=1 sm=1 tr=0 ts=69d0371a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=wxLWbCv9AAAA:8 a=5IoCURV5UOmB3lB6u-QA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: RiHH-3Nrlly0okdQqsjR4QHQHSOgCnDO
X-Proofpoint-GUID: RiHH-3Nrlly0okdQqsjR4QHQHSOgCnDO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030196

On Fri, Apr 03, 2026 at 09:23:18AM +0000, Antony Kurniawan Soemardi wrote:
> Remove dev_err() for missing channels and rely on -EINVAL to report
> failures, reducing unnecessary log noise.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Does it also prevent users from spamming the dmesg?

> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/iio/adc/qcom-pm8xxx-xoadc.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 

-- 
With best wishes
Dmitry

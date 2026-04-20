Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822521C84D0
	for <phone-devel@vger.kernel.org>; Mon, 20 Apr 2026 12:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688300; cv=none; b=nXW+vJ3TvAop3r9JgGDunjfVL61gYYBrgYuxUqdkiRQhfUEhsn0GroH2V40Even8uv/tyeEkzvF9r29JOVLJL/2S+jLQNghpzqcVRVsHys/LM77URvUdX09xuvahpCTj3MfXo/YLX/g84ZMGYKij3c565xyiplzbe46tVG4dmTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688300; c=relaxed/simple;
	bh=QyGU+JtrD+xfoAqSO/a6JhIRG4Nj15cSg+hd4z8eLWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/3/boHXtrwexhKBUATlGYG8sie0VmTdVSDG7i6pFGDs2HzqP+sXAQx/IHBxqGBXYMwwCEQ5+u2SK/jVvB7XG1WnchC87cxinr82TNNQL2qhCAXT+X0eNn6BwPzpJlZMa+nrN6EW1ZhF1vVWMOmUohuOMmWNaaqZrH981BYSv0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lhVwzEAz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jEyA5Pay; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lhVwzEAz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jEyA5Pay"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7Z1663455879
	for <phone-devel@vger.kernel.org>; Mon, 20 Apr 2026 12:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1mHBiu2kyCdwn8vgppYE+gc92gcm7L8eP2WtHeZFDk=; b=lhVwzEAzfHqo9aGe
	atEILuZcF3EqA7ImomSmqrJJaLnmSwnHX2ol2nDReWzhCnvB/ZnUBsaczHV7Sqqn
	UCXC2W12Y95QD2fFm4W4FTJ9tSjcUwmP+xH+bcDBBhirltmDd7Pc21luCz+xb5M5
	jdEWtEcIVJOdyjeeaGWkpASC84ZCeh+IkVNX4dBSzymTPbHjji5HWWLsC6W9hFBR
	CZ9UVCfZPRaqqFvgrEcOGjWcU3hBDzXcH8NsCYYkA7UdOroYYwkR2TEKQV2JwA1I
	rtWJnuSCwaKQBmPfJYbZkej1GF4/bqYtJ+WyLAyY2iOpWxf23B7se3NFnUmY5Udq
	zBsaMA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjs7re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 20 Apr 2026 12:31:37 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-479d605705cso169467b6e.1
        for <phone-devel@vger.kernel.org>; Mon, 20 Apr 2026 05:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776688297; x=1777293097; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M1mHBiu2kyCdwn8vgppYE+gc92gcm7L8eP2WtHeZFDk=;
        b=jEyA5Paylk5AkOJM9yndesbST3nP5/ec9pVa0v2KuGTlRKrQinBkjYNOR7nE5dBSSD
         ICQciD7QnStJQ92E5G+doyThsv6xZPO2db7dfhX5h7A2Ss9PE0VqRReG9q25ayUx+0ul
         4OR8YX8X/s9ttJIAGqX4MHXaTWBXK6o3SCMSF5HTfcCyh723NBRf2ZM/Rc5DciyswRct
         chvqVrwyDSFDG947nfJs3Mp1ebkxWBAniCkPF6l7qjw3moYtyR6N0c5s/pCd+q02tJTS
         /5YQymnJDZTRn1j3u7cbqkfmSbULFXpm+AuvlelWjtUUIJkCNN10uF1fFbmZejnHQF4X
         aDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688297; x=1777293097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M1mHBiu2kyCdwn8vgppYE+gc92gcm7L8eP2WtHeZFDk=;
        b=Ou7KL9uVb0LXuN2gHy5W2JsjHtsejmVjv8WgxPmoM4RzlBVFl+iLDSCZr18PrVcxk3
         N0JT+39RtIp/qBc3ZkdpcbYsx33+b2XzHVnzsCK7eahHiNxMYYpk/YW8p3JD8YKGg+X9
         nriLaMEr5GEIYrcwTNpByL8PeYi683Hw5CL8PDWiiThwJIXnzW0DxNdz2xMI8tfj+Zzu
         HW2BFed2eNn7tkIwXvnonI1funbceizPvW5Wi0818X77OuVPbwwcuPw+cv37P2VRsHf9
         /AXMDuRgTfV0wuJusvMQtlT8kTPAjLExtnENwxeqB+YQ0pGxB1IcaQoI2dahOx65ymUc
         xSIg==
X-Forwarded-Encrypted: i=1; AFNElJ+DdJTqe65PoNbNLaVV8Rfkz7VVmk9H+1NcVa6pDurEEcI+5GAAGzzqhhSwj4VwQzyYXXlm1g19wt6pgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKfc9C50LqFK5iQRHNxrfbmd2fVoPqpv6LILNjHgXqd4xrp4s7
	Dv8a4i61O3D1vzK+Kyq6evSBoRFORWqVjVR4x6i4t80HWB9xYj3znv8dDBCuRsqK4/BZYjv9k63
	5SVYBplkqVZlI9KiFwbK0Qtp0QBIL7b0qKOdOaFKyGbqL0DsmsWl8Aqs2YcnGro2zuw==
X-Gm-Gg: AeBDievF+kbFDGsmsN4ymChIRF772VozD6JGCejtn3YEaLV06wPjOaRWSgKcbVuUmUL
	SBtLdnGERMgysClurTTiRuH5OHPHf1s90CwlacZeTinLn8SvXoAEB7LUNJ8cDA6fyi0FpWNQuuk
	AGLD3DcQ/WOLtzgP2DmNJFMFLBKhLzO5GfR5bpHUCHcfCQYvPmejcuiwT4x9THWqnrKFqkrQdpl
	b+LLm29Oak76Db6eKR2PaGSbSkwMf7hPi+ZAjQ1HpgSZTKo1SeJnARd2JBUFaNBhqjis//0Gbu3
	J4CxugVtm0k51IBk/BIIv/inhGeMQ90sdxNU6K7E6IQZlerqn+tiTHJWu/cL8Liy5SsluPLMIoP
	CuyGkLIYdB9tb6GIKUC2yM45J5fg0VoDUqYelpN7TW13rvDQvyItcSG24aLN2Sw8PAekzKWrSRr
	uWsBmZcVfS0OOj9ADZBlk/zduWH2xtZlR9A1sNqA03o6sQfA==
X-Received: by 2002:a05:6808:4fec:b0:467:2509:c20a with SMTP id 5614622812f47-4799cb50f32mr6675104b6e.47.1776688296824;
        Mon, 20 Apr 2026 05:31:36 -0700 (PDT)
X-Received: by 2002:a05:6808:4fec:b0:467:2509:c20a with SMTP id 5614622812f47-4799cb50f32mr6675055b6e.47.1776688296347;
        Mon, 20 Apr 2026 05:31:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec0c2sm2925137e87.82.2026.04.20.05.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:31:35 -0700 (PDT)
Date: Mon, 20 Apr 2026 15:31:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>
Cc: Erikas Bitovtas <xerikasxx@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 06/10] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Message-ID: <aktvbu6ckco2zfmt5pxyij52q2w6olwwlg4ziuqbdya7vrtxmg@w2rizg5zymhq>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
 <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
 <ad482bdd-2fb5-432f-be1d-dec25d9cbf5b@gmail.com>
 <37poakqgqhsuavvrm2dyzwk36syyq44o4cfdsylkzwsupbh2yt@ycdvyrxgnrcs>
 <a09485c54946b754741259540257393734b518c3.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a09485c54946b754741259540257393734b518c3.camel@apitzsch.eu>
X-Proofpoint-ORIG-GUID: ZhSNpP-ob_PfymU4575QEKdK102yVl2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMyBTYWx0ZWRfX4sQt+b0O77fo
 dZ1oi5+baJRCpLjfejwppdA3PmhRt/ccM8ONlt8nZ1eRKC5O6u+kC+h8Lz497HSSMgzogcVjsT1
 wlgpkMol6aAD2PWSgHq+3c3IkzZ+XT0JmS/1X1pJpCWFslUKq8CVaqcp08iCu/WGgDna/aJyx4U
 Opmm+72CXk03AAD9E13jKwSwmJADQfVXGjd9SYL7A3GYn2cWmg5rkxJ04Z+oBTI7/z/i3d2kQlS
 iXzkV7DiiYJ5SVd80u+ee4534dzuMWvMbIVC6uZDqHpHHOHi1iY6A6jkgHczAN/uFwlrEVUvhCM
 6APzy6WuNNThD+O3IkFZCIrDgp9ZyvX191ZqrOCd5ztJF+tTxtRwhh21dE7K9d/FWt5ZlcgINZv
 6yceKxiv58+VRtujm79mV3QlU0CU/OUuNZhYh1fUfNfraYSuvJUBS+Q8bNzpGfbB4c4JcOz49pD
 L6LjI99cO26bZ0x8K7g==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e61ca9 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=Jn2JxawGAmoOaafwVl4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: ZhSNpP-ob_PfymU4575QEKdK102yVl2R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200123

On Sun, Apr 19, 2026 at 10:26:56PM +0200, André Apitzsch wrote:
> Hi Dmitry,
> 
> Am Samstag, dem 18.04.2026 um 02:40 +0300 schrieb Dmitry Baryshkov:
> > On Thu, Apr 16, 2026 at 07:57:30PM +0300, Erikas Bitovtas wrote:
> > > 
> > > 
> > > On 4/16/26 6:17 PM, Konrad Dybcio wrote:
> > > > On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> > > > > Enable Venus video encoder/decoder for Asus ZenFone 2
> > > > > Laser/Selfie.
> > > > > 
> > > > > Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
> > > > >  1 file changed, 8 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> > > > > b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> > > > > index 90e966242720..231a3e9c1929 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> > > > > @@ -267,6 +267,14 @@ &usb_hs_phy {
> > > > >  	extcon = <&usb_id>;
> > > > >  };
> > > > >  
> > > > > +&venus {
> > > > > +	status = "okay";
> > > > 
> > > > You need a firmware path here
> > > 
> > > When I tested Venus on my device, it loaded without one specified -
> > > msm-firmware-loader creates a symbolic link from modem partition
> > > for firmware. Additionally, none of the MSM8916 devices seem to
> > > include a firmware name. Has something changed since then?
> > 
> > Us becoming more strict? Or more caring? The default file paths are
> > supposed to be used for unfused devices. So if they don't work with
> > yours (most likely they don't), please add firmware-name:
> > 
> > firmware-name = "qcom/msm8916/Asus/z00t/venus.mbn";
> 
> For BQ M5 (msm8939-longcheer-l9100), venus works with the firmware
> provided by linux-firmware [1] and the default path (here "qcom/venus-
> 1.8/venus.mbn").
> 
> Just to be clear, should the firmware-name still be added in this case,
> even if it is the default one?

No need to, but it would be nice to mention in the commit message.

> 
> Best regards,
> André
> 
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/qcom/venus-1.8

-- 
With best wishes
Dmitry

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903E7360ED4
	for <phone-devel@vger.kernel.org>; Mon,  1 Jun 2026 11:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313651; cv=none; b=S+FY75R7U+y5O5DLqV+ZbVFgEDj+HtQyq77AA/9CNa3JKh/e8UhFoQYTEpjD3PxwE1d7zeX6iydmy4KCYfimPTsyEsAhP6TjOVa58Jn0TczxZt3Q9qeRY4qW7/nQbtdWw223XQhTPfq0lEl+LZP8Ltzcrpbs1+oTMmInu3jpLQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313651; c=relaxed/simple;
	bh=8KpuVWQ6jm1r2rEeu3LN8WRKYbIYv+jQSd/1TldiGw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFBlb29Ni6dTpcepfigpW8+xAURPUh3hi5D3P7vajuvpUeY55PNckA+TgPGQqRX058npFYzrwTj9v8nDpUXuOEIdpb5pbkERE9uTL9It0Tt9mE2njRaAncSfDWPpDltPhHww/jXgMIgahqF0QkW/Ok7KNc2TuzDChxMxK4bXXYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hGd946rT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CG14OFk0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hGd946rT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CG14OFk0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518ddIu3563820
	for <phone-devel@vger.kernel.org>; Mon, 1 Jun 2026 11:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4Jjqk5PfzznUHaFXGq7GmW+t
	L6JCALGPf3ThF49riC8=; b=hGd946rT0wOrWOdrGu7/KB4ryxKyr6s5qWNbtP4x
	Z04IOx/+Oh4TjtDn3aZYFTYlaCTzOaae7GafFNzHfMf6tZnJiwUtH2/4dSmLFX86
	0SPejkUqvdOGp8/iVCCHrTtfN6H1UbrR3Ox+RhaEfXA9wZ0l320djF471iJX8sPd
	3l7IOf1pZB8KNb9d1+VaKc3XrsuHwpwX92ED3FX+toFbiNceIEFuMXHu+0zIezHd
	FRf4rsVm9teqDbQAmM1/h2I4Fe1Y5gr1pt01UuFOzXidaX6ZOWQU/pMxy7jW4NVx
	ofWkUvOgWHDm0pzvhe5HhdlgKqVYVkscAC3lY/jtHRCukg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6rxrqpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 01 Jun 2026 11:34:09 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cfb918a9d7so1774887137.0
        for <phone-devel@vger.kernel.org>; Mon, 01 Jun 2026 04:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313649; x=1780918449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Jjqk5PfzznUHaFXGq7GmW+tL6JCALGPf3ThF49riC8=;
        b=CG14OFk0getzBzeKUnFjFOu8tT/BMejrhSAqw2YCM2BzWaXyHwY7Rb5TIlWG39GVid
         LQCHCP8BNsxDxg63jzcOm7NvLc60NxdQtkabs6kJYP8FVaqRsqF64uHAn9332KQ/sczK
         0NlAGj3DQdiTlDPVTyR20qDkFzZihhGtpQkUgTVnynQNNxOB1iiD5l/JALR8PhfP5bQb
         JPqsST2kQPUAceZJSLtz+SeygMF/+iwAi9qSBnuYi8G/3jrJGfRabIxfAIXLxrN9hFOi
         BUwkzJTzUstIhYviVE27Liipgjxx1lRu4LvNRo1y63xsrqWh1ZRYk6fnxhWTy3rwFDEY
         Snog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313649; x=1780918449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Jjqk5PfzznUHaFXGq7GmW+tL6JCALGPf3ThF49riC8=;
        b=iOW58n2YXkvg+aeaVOBBDV4uLWZTptEUc/5qWHlUgBdTYe9OEK6Ces5bsPRl63gvw9
         T2tYBOMSmnGtL7u7zCyMOqhQerFQ50ANGB8zWixj72Z4sLyJ+bVkn/mwq5cEVODF4j61
         LpLFWPwtDYbskhSuo943OI2ASLJKzoldGN0sC96ANrSRPOMpwLXB+broqB1w0OIhWygL
         mYvkBMizsCyIHZirXIxW1SdARJ/2CskFqo16mFggjHUge+HfpgaU+AYSIuYhcrkVHxpW
         H3vh3xXHtpnrxUhRtrKbuQ9IADngq3AR/Lac+VSnsPHWx6G6CxsGGTVsOVTWsf6whBVW
         pa7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+04pRbM0CcslfSDtlgUFVcmKBFd1OhykM+HZmOvikx+dEB88G7CJMWEMah41QKKjKrsV/BEkD73yhvcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt2TynBO5ANPd/wrVxfg9u9M3OeBvuWUrRFOywmtwJqN4ULC33
	JuwM4oqGWETTSZzYmIcK8AiHG2s0sDH1gzpTbRvfIqohvOlzfpugmre1933xi8aSPAGr5cNSGoP
	3xhqefa1qweVVwVvSZ6q0E2B1FM/xgWBH3fZ9jg5ApMfchk1BfV+PAZHOOb1zvuv78w==
X-Gm-Gg: Acq92OH3O7qVd/GZvEtM72GZRUw3xoczZ4W5ujER+rEGs+rXCdqYHh7vjlZRC8mw1Fb
	5XMiISbYTF//0hmdcc4UTHPjcQeRVyGACJYDD2laCqzYc3wO6LN+gPb0IxRMEgpyKDaIFqfsg5t
	UcJw9cW/9foB1TwMsDQkLvUpNYJoaC/vcHmcPYc3jGVUzHcG0Lg8FrTH0HjfAUCTzp4oWWz2tXI
	XkKryEvxq/PRsG8Wz2lgKTG8tPkciMGGhF5mfqYLdAGfwNNuNqaSADkVejLsH0CnsBS+SKlAkNV
	Unw1zjnM1uTQrDSjSBRIXlA0xK5nf0WMVlnUc5xFqGtcNl4pBe/Qaoy+Z/QO7jdyCELskJ/VX7Z
	04C07XrABIjIKTY6E+Ek7qWbVAWnToJTWSFL97EdIbNaw7V90K+1VAKOnxCVIOnbJjenRoaux0x
	26iG7LQUC2FzEru/j9pwFzwtU1moMCFj4RCqoITNx8cmnjSA==
X-Received: by 2002:a05:6102:2d07:b0:631:8665:3510 with SMTP id ada2fe7eead31-6c68cd84c2dmr4027196137.31.1780313648822;
        Mon, 01 Jun 2026 04:34:08 -0700 (PDT)
X-Received: by 2002:a05:6102:2d07:b0:631:8665:3510 with SMTP id ada2fe7eead31-6c68cd84c2dmr4027178137.31.1780313648408;
        Mon, 01 Jun 2026 04:34:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39659c91febsm20928961fa.15.2026.06.01.04.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:34:07 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:34:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH v3 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
Message-ID: <4t3vit6et5coeiqhv2kw76qyxki2qfktf2wiczt4gzohri7rg2@eolb7eajunj7>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-3-fec6ac8dba02@smankusors.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-msm8960-wifi-v3-3-fec6ac8dba02@smankusors.com>
X-Proofpoint-GUID: j03OPw-IPDse-ncH8YwlVF86UTxEaWSM
X-Authority-Analysis: v=2.4 cv=dsfrzVg4 c=1 sm=1 tr=0 ts=6a1d6e31 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=wxLWbCv9AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Pn3paz4bqnjGj1Rei2QA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNiBTYWx0ZWRfX2Qw2HW736ysc
 zV7MzRrqWXwpxPkbEwsSsZCjCB25pAtN0sgYA/IKm/5DZ5qwBUSYWxZSM7HnX/7aKh5lmvExmbP
 DYxMC1xK9tF0jsAQSNZ+/TmN8kx22najupPnKg2PwjFkT36neK80z/udX7cLiS70dpHi4p+EE+y
 udF5hNVRffsaAcPDf5duQPo4llybfEV/o2uLcmpz+YWSW6nYq2XLcfVsCNYscm7pR/ZjYbP5INo
 +RVmdZcOedkSNPADiWU+iMe+v+5u7dwwPSPbO+KwFtnsntpbLL58XY/U/T5ra1g5dt6I1LH2T1m
 zmmNNTrU5XWsl2f87QRf7jZ19J/YJn28zDdAYZgPNa62MqXe1oryE3aez+pNK1RA1qAWjamQf6a
 ANp4mOqvtwvCe56OGXH9rw2sNRAYt+Gb7LIGj+tFKjzxsC/XySBPUnZK5Z2pdJErjew1lD595nX
 uskNptR69+1HSVP5SHA==
X-Proofpoint-ORIG-GUID: j03OPw-IPDse-ncH8YwlVF86UTxEaWSM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010116

On Mon, Jun 01, 2026 at 03:51:16PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> The msm8960 RPM resource table is missing the QDSS clock entry (resource
> ID 209) that is present in the android-msm-mako-3.4 downstream kernel.
> Add it so that RPM clock initialization succeeds.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/mfd/qcom_rpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

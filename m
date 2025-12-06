Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B38212557
	for <phone-devel@vger.kernel.org>; Sat,  6 Dec 2025 04:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764994385; cv=none; b=JfQUNAOrVVknMXcFOiunnh0LfqUmjVbtXFpEHwOI3zDgvMff0UdjH2G7bVXtV1xLz8qTeylmJmA1riTRkl5FBtNhp5tTfHAuaD3wCd+iMenog+EZ+cADj3eSk2dhwyoHTrY/mXDoVfaqgSyt+Im687c7quUhoDEov/A+r/dEChI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764994385; c=relaxed/simple;
	bh=CI9OQmR6bO6fBvEL7pAivSNsXX1RDFYeu9p0jLmq0BU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1LPIvgRtDrVpb58bTPnQhhNKvro4RqiNKCpFYGYkc/OtoDh1GHZRkW14UtUWuemoEpk9XieHX7NS9L5VUAKwI6Tmona4cRtgg6gid+MMZyAfZQZYQQ2/k/u1oFZjcoloGgxsV47FEpxhni6tdCs2e/fnHkxPAYQrlRsqrcM1x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NKSNEV2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DAzcGU0m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NKSNEV2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DAzcGU0m"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B63dCv72875984
	for <phone-devel@vger.kernel.org>; Sat, 6 Dec 2025 04:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tpDwo3AVFEqyo8uW2zQ2fAN5
	CJka0mLD3vVFUxIz6Og=; b=NKSNEV2sPW/NLZtegux03RPcUB7WqOXPXJwnqVh6
	NTx5LrFkEIpN1fpObwbVlyv8atVfIccyswvVv/fFmDUxBHWVw41P77kHAnmDgjc5
	U58G+ymvzAcY7oft2+LqPIBcbs6ktwmgTKLxZ+q3IQ7hqZobOrLMDxAHYusmzPFM
	r4Irb+SP5FSnF/rIJgOW52hv3hMpXlPAYDZX6ZDJDvmuLCM8aAYuT8ddzXrjGgDO
	akKPhIPpRM0fysBZggJQH3/8yphmo8yoSHXvAkAJlBPuGK15Tzf7jAw5odn6gPDh
	1STmBUwXgyv+Yww5UTuRp95/0FqHe3ZG9JScb2WRgmdo0g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avbga05gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 06 Dec 2025 04:13:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2d2c91215so626326485a.1
        for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 20:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764994382; x=1765599182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tpDwo3AVFEqyo8uW2zQ2fAN5CJka0mLD3vVFUxIz6Og=;
        b=DAzcGU0mIm9H6v8DCORQfhQx8g3++mQtl+vVJPEgbf+Z+vf+ea4zHouVXd3SSxe6ZU
         MQAlA7NpYOWp8SrIv5scgaYKEjuCsJ9QG44HMy+w6qf7RXwOKEHE8eGYBbSMEA1Wz4JB
         wBGWXAZNeEZfvM504YqiTqmHxD3qaKm29tyUV3yvXUzLWpmjngBjY8EC8efDbRaxDRrq
         Src8nDPKKSP6QFp4dO9786PZ4xgxxfm1a6eYXZToqLDXT8xQ7S9dE0H0mszitp8HjkCm
         kJpHeSbw/GXTuZ698o6xgzmML+L1XBVrtfUmckWa3CJET99u1yXmnAvr8fPFuEbLcdO1
         y6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764994382; x=1765599182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpDwo3AVFEqyo8uW2zQ2fAN5CJka0mLD3vVFUxIz6Og=;
        b=JQW8DHwgX1L9vJ6fhhb4EmCM504s84WLjG5imEdyQxa82Tg2bVsVogwGcWiOM75jcw
         9278uoXQ++KWUM9iOsmepAm1i78iYL00Gt/GcToey9XBITh4fHDO+PvDL8q1+eBvhMbX
         5R2QwDhztURxmFdjrPwD8NdzYyURO468OJLx7cMetAPX0+87jkvCgdkqhvyNzZqFYwVh
         lb/u8xrcSHqZrWQNsqpTH/nYf3bs99DDXGNZqIrLkti8CGpTQamsJjQOsz3Q8DB9TirZ
         gOTa+mGmVVEJ5szoZphUA6iddIMsBgA7QsuQn4c+Xh9Ja+bYG9MpyPJU+lhURm6qeTyr
         YWmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNRo7/1gjjwtnPeLPYSW78MbMKDmqtSVfTfn6Amdf0pPzCKbTQbvMYJD1E5QfPq2+kbTNg2AU+dIGwhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzERra1fgNpF/94WSJnVsJJGkHHItY0QrxWhOR53+7F8HjFdr72
	La6VRUG+QNzoacVWIxDIJDPAn7Qr21xK6fsT4eP3zVquTECqzyBSKWIBm44G10ENe+d4Fuey2CJ
	iy2KSZaEKIASlO1lVT3+0K0y8+Oc9sDlEuUwC2b+NWB48rkeheqsA/5X/cPcASxnxHQ==
X-Gm-Gg: ASbGncuHMEXzqV/wFmaIC9+G7nHOoIC3pOo0thd26Dseaj2GbhRsPqLKgYXnDULm/Ld
	Y6YFVaWTOlTXXLYKpxwwzl8Cn2poxl0R+ZlE+WDBejC2f6K2l1wctnMoUKAY8eyxP4UaDE9mTb6
	9yt7tWG5NQesE1tqiOlMOQvMuE4gPqB8PfUia1WCek1oFS7VBota18IxFF2LKociQ7beMA2YnM7
	C1oDIVRqODu7K7YEsBa9Cn9v3P7kqJhmWYpQWn2xyKV+RrWIN+prjieiurV+sr5ETjFPEruY5Wy
	7k8NrdGgYGkEpZEsjE4MYMxIr3F5ey4cvrbfHl0fSxvLrVofWsGVPM58UJqa+J3a8VrvfdF165D
	EQdYRPJY34g9cuOuY+EGr7mYcxNNW3JynBrKQZE7u8WNgH3xqYbSqnhMdEZqHS1nhxDwSQrSaBe
	tbBdYq9Y4R6rKbQAZ/5g2egVs=
X-Received: by 2002:a05:620a:17a3:b0:8a3:c4fa:9b58 with SMTP id af79cd13be357-8b6a233151dmr187945285a.10.1764994382323;
        Fri, 05 Dec 2025 20:13:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpJHsFQhad/ybeRaGffC96lG7VG9syusgSlhnLEPrgLX+czXrCbZ/KXbv8LjB8hKejgBvLOQ==
X-Received: by 2002:a05:620a:17a3:b0:8a3:c4fa:9b58 with SMTP id af79cd13be357-8b6a233151dmr187944085a.10.1764994381843;
        Fri, 05 Dec 2025 20:13:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e70595fbcsm19441981fa.23.2025.12.05.20.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 20:13:00 -0800 (PST)
Date: Sat, 6 Dec 2025 06:12:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 2/7] i2c: qcom-cci: Add msm8953 compatible
Message-ID: <2xnqccipxskew4xmm2rmmjey7g46lu5lcnormgucoyjg6ch44m@deu4g37l4rcd>
References: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
 <20251028-msm8953-cci-v2-2-b5f9f7135326@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-msm8953-cci-v2-2-b5f9f7135326@lucaweiss.eu>
X-Authority-Analysis: v=2.4 cv=d4z4CBjE c=1 sm=1 tr=0 ts=6933ad4e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LDBv8-xUAAAA:8 a=dlmhaOwlAAAA:8 a=SfhF9SiZLXNrBiBhEFwA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=DZeXCJrVpAJBw65Qk4Ds:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: gOIjRLVmty6CzDLTeNMFaTjnw9Tamwqr
X-Proofpoint-ORIG-GUID: gOIjRLVmty6CzDLTeNMFaTjnw9Tamwqr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAzMSBTYWx0ZWRfXzqV0ibRmUmFq
 sVAnt3vlvPXtufLxvmwMGmxNdC/R9OqjUBBA0L74oiYv/lZ3hewqu2YyxgqOgN/A2IyNZpxXkVW
 +xzyyt0TV83jJtEzjGETDBo2rAJXIMjBS1MtHw7I3ZL7DTbZy3ZYj+chwrFWlQyB2lcggJeR0oI
 Of+paWGRqcGHBisBKG6aqEL6QMkDag0udXRS+siGFhHXI+f9r/RZ3HRgkdwtJCL9OmI2xk3fuxP
 D7Pzwz0JI6LUxs7FHZ+LVw4S5/EW8IjUpRktYk1RRUxtnbho+VG4RMRpWJ4L/O+1g2AdXeoN5cE
 0d3M0dU8WgGd8t0hRSupmS7fXBsHEEC4W6Lctx4Gu8JS0prrVRuVyGxtJ+Il7TnECD6MEFLtD7u
 AkHJW8J1NGkNr37XznCcHbFvbW748Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060031

On Tue, Oct 28, 2025 at 05:40:47PM +0100, Luca Weiss wrote:
> Add a config for the v1.2.5 CCI found on msm8953 which has different
> values in .params compared to others already supported in the driver.
> 
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 46 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

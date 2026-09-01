Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3793A545E
	for <phone-devel@vger.kernel.org>; Tue,  1 Sep 2026 14:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272056; cv=none; b=fu2tmmWuWcyeuK1xSwkiYjS7kLJ5OhbusNKjB+k3q+1pMbU6H95iPDCMi6OoiISiWwKXgx6aIupDhm5ognqWrYdQDtdrzI/ae8fgQxp0oAMjldklv94xERpeY3k5MOc2fz1rPqS4wamsbHi99z7hgUQp5Sny7keYozRWK/RKIl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272056; c=relaxed/simple;
	bh=vMnnwb0rO3eK3ov6NV1/rxMCMSwFIvmsP/AaJmQCUL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ri6sk/JWCHIPU5QIwdmwOMqRTALNsBeZm0AzL7HRzrrJFzcUdDAf5V608Kyqq35NFD4YHLPogOLjEqD9s8Qo5Tk/7K8AdO8wrQIU6YyXFb0PsfN/h+PoXNN7ogUGUGdwRGmk0NQ2i5yA0uHnEkHLNZv0FKAcaDPQxrZVvHk0ICw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvft3loU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DPr2nBbC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvft3loU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DPr2nBbC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8ecD2270419
	for <phone-devel@vger.kernel.org>; Tue, 1 Sep 2026 14:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bv4Uv599hFINUMQs89D9NhcUgICK7SVTcszNB76gMRw=; b=hvft3loUtTLHubGB
	ThFXEaHZ8MvwO4iDbUk90nZmCRgQSABpUKLQBlPcZwC1+bFvWajY31qsZSbl7hd4
	5S5xSVPlE3ejYacaOBHgtCve7kBV+D9+NNRCKF4MEslVAwAMgJCcwfxagSFmLwEK
	hYzBykFfQrIuB9CRWkIFXtuaMy5/8A38s3WcziWqqooKWBVY7vNxIiNLvv6z7REd
	SjOvUpR/aW32d9RtWRa8+IdnklYVT6jOQgH13AYW28ICqgzc82dRsfj9e39S3dug
	RmgjY7+53h9HFlKQXYTAKcFTjmK27htCwJoi3cIIu8IGRxLy2MKcYbsKXzK5IG7p
	FmoHrA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx3mxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 01 Sep 2026 14:14:14 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bf89cfb2adso115784e0c.1
        for <phone-devel@vger.kernel.org>; Tue, 01 Sep 2026 07:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788272053; x=1788876853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bv4Uv599hFINUMQs89D9NhcUgICK7SVTcszNB76gMRw=;
        b=DPr2nBbC5/c8v4n9IvILJCH3yjsXQcTWpOs/sLk/Fw/FFgVyzQ5VJwyIC/C6UV+b/I
         JjH1DSxiry4wOJKvM/4f5mWJhUYViPRDPYMTrCVID0lrXoZWCBVNi01UxPQSIU56ptA3
         3+CTyigdtGkFKuqMptEztUy0hspk0YanCnH/A2fOKy6RqhcmUV3wpJu340cTGBXToTub
         An8RkZOvXOn7v8fjAOsUpz9V9onyr0X2kqY9rc7kamv9kk/i5LTzDgp+6d+FyqNKUYY5
         F5spiML97snFRGFbbhJ2BBU/6rzmPPBkXcvOUtsbo5SG9MFIBWrA4QGnm1CEMe4Al2Fc
         iGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272053; x=1788876853;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bv4Uv599hFINUMQs89D9NhcUgICK7SVTcszNB76gMRw=;
        b=AnZNQAhjp01n2D8FY2IevTeAZpRcDYLvfYGE6vfL05oQVc9k391VwIMryKGpFNAcbJ
         VysiQx6NJE0fEe426ptPipHBc7jsgIeWzqafgT17EtDBTd71gqGVV8pA084iVidMCU09
         h/P2xsB1NPkpBFruPKDTBBvWYGZMH28jrlGiT/kJS8nqsSe0ayBOUKX+q7Pyn62o/3bA
         z9+z2Me9C3K4iLol8h2Rr7QQV815xNoklssOH5q9ybDW9zby+0gJvBdlemltuRLdo/an
         9CA829xRDoizJLamkNhCSW7cyxRy9xlackrgjahJumHhZZgr4EofRciuizfK0Bq0Ljma
         OXQg==
X-Forwarded-Encrypted: i=1; AHgh+RofWKFPHoWPQVMmvqBlA3j0msEaoLAb49vnaFU2ylYZlFVecYgvyleJnz8ATSMmDP+aWMbj9mTJXZ+b2Q==@vger.kernel.org
X-Gm-Message-State: AFuF++n+r8+NaPQOqaHtip7FIgiR/f6EGbibFrCnWgrXKFhTdgIiPh6P
	qjUHYivU5iFmNDbbs2M9dm04yuheluR6J3cQftDIioMmHrxBOFrpGwsJtdcoB2GjVpdfAEvwQR2
	M1SAF6UD1H/I8ZBypbHJPREPsBfanw+3695a/bCObR9E6l2sPUO1bmRJz9CopGufTjQ==
X-Gm-Gg: AR+sD13infL5z9WbC1uRySxpz0i+msmhCoBNeyv+s4YPcrj/cui7hEro+WT+pR0AjBO
	KuaTf77YgP9gBK0GTXmxlra9BsYzzNRE+bzW/PEglxH3IJR98Sc9Lld+u9dqlN3ryN5hxreKQTx
	RiobjhMQ9dEYrUisiTP2Aoo+qct4awAQDgbTtokIkBBHcB5WrWVoe2FWghVSMm+E4uASD8CQB1C
	Y8ICmRx3yKxwnzhxbXUAZoHM/8oaLlShMTs0OUv5uFk2AyjkJTFF/Or4D5Or5MpHLHCBLZSLxKD
	xTnOa29hC8JcVOHUGrgACSEadFxpt/+BG3e8xVQXn1aaxScuB7IRNwbgzJVXuTknv9UzDtFK/Ng
	hy5a2jnhcT29Dck18Hfzlng==
X-Received: by 2002:a05:6122:6c0c:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5c680966f90mr5189745e0c.0.1788272053134;
        Tue, 01 Sep 2026 07:14:13 -0700 (PDT)
X-Received: by 2002:a05:6122:6c0c:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5c680966f90mr5189697e0c.0.1788272051762;
        Tue, 01 Sep 2026 07:14:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67c74bfeasm272224a12.31.2026.09.01.07.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:14:11 -0700 (PDT)
Message-ID: <7943eb21-84c3-4708-a058-e40e66f9d7ee@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:14:08 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Disable PMK8350
 PON
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260901-fp4-pmk8350-pon-v1-1-e05937e9c860@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-fp4-pmk8350-pon-v1-1-e05937e9c860@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96ddb6 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=gvnL6on5FGTgUggAsZEA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfX/ZFTGmv5agG6
 uwv3Fb2ISUggUWPrXqqdbLlp6dJGOG/y8r9NpDWW+MlnaveaUJVMN6HIbRWCeatpcgnLEjC9TGV
 B+xaL3pBm0Gvp6v5nSTDMhTJH3xmsyI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfX/CdrZnKz/mWl
 PidiLqrYRpWdq2x4vILE0P8LDwi//RLSDaQ1NWiUHLgrHjVI58qN3AMq933MkAPI/y7P86tqwwW
 QIWpJw/Gsx8aAWD9A6A69lDgw5ABry+jpJ9KyRL+4+XO4bM//By+9Nh8uODk9JiTtwH/huPbSfp
 TIpV0z8w4egCmUcSd1OmOPipCbhkeGGrzrHKM0DIJn56of1zaHbnMmacs4XDyt5+l/Epn4NIl6Q
 TWgYaaGNxIMyGIUMXYuuMfxujmVd5TLwJuulMJkXP9NoHh69Boqewh2QcAbET78OqAIE6JWAwtK
 IAwNBD2lHdfdaIvUAn7APSbrruRs4FLXU2RfknJIbagyL3yUHp5jybNskQMXVaqcSIHrZGGfr3Y
 WyBwfhES8waafRBMb2b8tz9/s/3twUuX3FpXCxai1lD8q/Z1zoNiFzvZWvGHBVlhUaXsAvhsVMb
 rgX+rSllW3rAJqupGMA==
X-Proofpoint-GUID: RTaTa7niGndYFFxLO0PE278cCR0LsoTM
X-Proofpoint-ORIG-GUID: RTaTa7niGndYFFxLO0PE278cCR0LsoTM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010125

On 9/1/26 11:06 AM, Luca Weiss wrote:
> Two PMICs on this phone have a PON block, the PM6350 and PMK8350. Only
> one should be enabled at one time, so disable PMK8350 PON and keep the
> PM6350 PON.
> 
> Fixes: 582e7c1026fa ("arm64: dts: qcom: sm7225-fairphone-fp4: Add pmk8350 PMIC")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

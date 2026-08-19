Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8721F936
	for <phone-devel@vger.kernel.org>; Wed, 19 Aug 2026 11:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787139601; cv=none; b=gxJfpVcGcndMGDfvgqtkkcN4CDScMmhL2acCI/KnJLKpTQ8TXHs36C9eInE+dq7dRsVPjxUHpmpgkvtlZH7C9X7d5qrtvIA0Yi7qwREI0+j7aaJtAuHhfeu0asXnwe8AWao/x0KI0UdXMCtlD013J8rMhrCXek4dkWLtmwvX/SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787139601; c=relaxed/simple;
	bh=CsTuZONaAyeuKxRSACgHhfq5qOIK3Djua4qKrdXnoaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H5xSM2ChTP1EKUx6AKwdtLHY8NpT1tt4szuAAKUIOn4P5eqpsCWF/irSau1PmroTcquFLiVGMgiBfRCJRTftTVece6bLwJtllClJlAdVAvrPd1WSsj05ndf7M+axBr18+AI8cO1qzgs5JHxoISLvcXcqAocoP000n9lGhL3RZMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FUykGVGb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vvr+2RYX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FUykGVGb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vvr+2RYX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA8q143730676
	for <phone-devel@vger.kernel.org>; Wed, 19 Aug 2026 11:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i2ThMck0OybkTkoB8TESZ2HY1tuZaWXzrY261QABM5I=; b=FUykGVGbBjegpaaD
	jV71XVZqpEe2ypqweCs+uDUwXTBa1WDcwxjOOC0mqwrPZN0WbfqKOf9mQReSNHbx
	D01Cn5jgH7QzzookIElpXprboeb1zM5zvqQXMxvkx9Tj1v50cMaTKOow3O6kLOUb
	juXRtZvN8PluWOOk7BXTcQPXjPBoeddHI8KTnxio6jxNSwRW4vUahqPKMAHrKwhE
	Lwoi/OlcWTH+MK3e+bInVdtFVZW3LPMdQ30BJFlEJGMY8/Lz43GyqK7QpEOKpyTc
	sRL8kMfbzGl4e6Cd6T7c1ANt2W5H/Rtzg70TUassUTvPSPnvaLMnRolomqANWIGp
	+c9QMw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmayy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 19 Aug 2026 11:39:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso8054085a.1
        for <phone-devel@vger.kernel.org>; Wed, 19 Aug 2026 04:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787139595; x=1787744395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i2ThMck0OybkTkoB8TESZ2HY1tuZaWXzrY261QABM5I=;
        b=Vvr+2RYXOnMHX1Eo+CUFfbwLYCCODxfPO1lf3AfOYbG9cbojcYe9su5IwSKaQrj/Fd
         gzs5KaHXvrZIFF4ZhcUI1pRSPIW4WhoTT02lQgXykg+Z0qI45ZBqlGVV24ywUuUZ+FtF
         BAeEHYFZJEWkKRxF81ETcsGNYG0PYjCQ5Y98YkuXY13eGjilvMneMtmyJ+66yKakopwA
         wk0MCc87dhAUHZpIZ8kvlcdNvUyB8pQVg7tPrDIPCcfQy73hgpHZxomdxzqH+o3TJevE
         R0upHCh03IFFbqk9L7Jy1IzdyBj9EDtmK95fkIFReJBVjv9q+0gTZojPjHJk8MDhvccS
         RekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787139595; x=1787744395;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i2ThMck0OybkTkoB8TESZ2HY1tuZaWXzrY261QABM5I=;
        b=C2z58q+xxlZFlt/Oec/ZR5mWOJPNwSaXtUZzaGRevhetOR4iag5SDkU3zBRTYq1E3L
         ZMc2QrXd00oEviyyAP89sYP6TYYS1kOt8ojM1/UBVhqOBWOQaEe04aYT442jy0KE+xAv
         VLv0QhxC/qmOmeMGLGiIwUTa9ZWQR/tSF93qKVIdaM2lt179LQyPZEPRpt3Hgdi7X7eo
         lQBz8GRMqWLUtZ+FUYNsuQF2ykXfNr1Q1jkWGKQBjIkk2CEv0Q1Xf30+8Lvy6mPp8iIb
         bK1plbjTEqszkoAYF68pfHDTHnYlE+RDJsGvdwkQToqLMn5Uizyu74MWRn32H3EEpyqJ
         ua6w==
X-Forwarded-Encrypted: i=1; AHgh+RqPffB653yTXkgdAH2NXVJDLG5eCqI4RcqmNLQ3HyzhXGsLRH4aBhMe0XN6mcZSZlZLUx0UyMrcGz+8Ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKYXd5BGvXLTUCo92MtXq4FS5wbToKJriwX/Vg+O8JsfVBVF/F
	RO/3ycRlx7F0Gi7Q/aA88wOd84pzYwJLWEtplWel3jC/cELIUqR+AKfl9CDwVwDrtMloNSxhzLn
	9KmDCWP3EjjRA130N2xim9aVHxqvgvPWCpS/o689t2W1KsRAyfAJcmQxpFi+arzjunA==
X-Gm-Gg: AR+sD12BRIkhvPDXvGvThxSWhXPKQKIXFnvdX/dh5I8cE2mYqiJoWeZLOFGXjfUfTdr
	Kc0MkzN62sNzGAwADcTuxLXJnOygsgSYVVJ+8jKCVfdBU8SQzkzvKEC/ZPIggcKIun2h/m06IaP
	iHMxyWWpE52SKmAWhxWXMKn/m59fBEf10b9s4+3WHFf3PvXunSt5FDjw/THy+W0gfLv3WBoo107
	68i2a+vB+Ec9tOrmfBGEhh2WB609kKIT1zb37XELrN5GhHPXKrEnsIr08pFT1nkOwl2FaYalr3k
	b+phlqpIRnz5H0skQ5lV9fTavf7aJbTtJI58VUxWWaZPY52bsW4F4n6np35ehRnlzHcLY8TthE3
	cycm6kHqafKRdonWz9RXBOtrc
X-Received: by 2002:a05:620a:a809:b0:937:2443:3434 with SMTP id af79cd13be357-93724434908mr51192085a.1.1787139595218;
        Wed, 19 Aug 2026 04:39:55 -0700 (PDT)
X-Received: by 2002:a05:620a:a809:b0:937:2443:3434 with SMTP id af79cd13be357-93724434908mr51189885a.1.1787139594816;
        Wed, 19 Aug 2026 04:39:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff177b1esm713807a12.29.2026.08.19.04.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 04:39:54 -0700 (PDT)
Message-ID: <befb87e4-3b29-4e97-be6d-7dcc5e826dbe@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 13:39:51 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] pinctrl: qcom: Add SM8475 pinctrl driver
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260802-sm8475-tlmm-v2-0-a93e1d1cb53b@proton.me>
 <20260802-sm8475-tlmm-v2-4-a93e1d1cb53b@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260802-sm8475-tlmm-v2-4-a93e1d1cb53b@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA5MCBTYWx0ZWRfX/bHk7LGxykjA
 SXhvl4045HVxV204TnaCz2ntfi78C+yuwmpwD2Em4AhwqluXL018xIjBTYcJcSFP0FZlZh6QeEA
 33yeaPJfdzO/w3cB8QjnfwdYw2TBe0Fj8p3cuum0dYuVGlYzaTzQr3gbbSUb1DWWRQQ/3vh4tiq
 wkpmXpyQcCZtM+BCW0Qf68FArBRf9bQk2rYm0iA2eHzgUjUuw8MK6p0AlZ/XiFy8OCiFVZ5vK2r
 nw2jPC5kyYwG9PpW4UQY1Tgsw+RjsBnqpm+Tz2jEwzflbujAE75+zeIYjyMFPQYnPp8318c8FWg
 6FIAJMQ3w2FRpEOaV9DuTo1rOcabMvs42+Mz1h+5qFnahvvJYppLopjZsOctbpBoey0/SgWkhp5
 LJ1Didf8uXHF0IqZk7ocUUmnkRuX1/yGoPqyuViQbZzgvrz5fnA7n214rJejzUx5qJWLLgn+fJ7
 7V1RRTyMg7uRmEP827A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA5MCBTYWx0ZWRfX8JCVd6NTCSRE
 8pAD5xtehHJ5hwRlyVsB4h/s9b7Hn2z6od6pPCoc7g3cE402xMfavU2J+6ic4KLCEw2DVdEY1Q0
 NNYMv4q93CYxtAlVmFHwMXZi4a42DUI=
X-Proofpoint-GUID: KOmw_YMraL0a1noCPMitHMrAazVxWklQ
X-Proofpoint-ORIG-GUID: KOmw_YMraL0a1noCPMitHMrAazVxWklQ
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=6a85960c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=iyVIhWazpKipxYJLXtoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190090

On 8/2/26 9:30 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> When compared to SM8450, PLL clock groups differ on SM8475.
> Add a separate driver for SM8475 based on pinctrl-sm8450.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

This is a whole new driver to accomodate a single change (removing
function3 - pll_clk_aux from pin 98). I would just add a comment
somewhere and not bother, especially since IIUC this is a debug
mux output that doesn't get used in practice

i.e. I believe this patchset is unnecessary

Konrad

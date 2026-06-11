Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C899E3D9DCC
	for <phone-devel@vger.kernel.org>; Thu, 11 Jun 2026 11:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177544; cv=none; b=cPUMmSCBCStuhNO3ETLsekO6uFssL5iQYICRlLFYKGq2cQVmsziqEixFYVhE2w0tkt2I044yD0G0e/kN5zh62Zw4fnF7L11vVp7GrEovyz6l64FM9gWiqP5Ix2oCufja0qk+zgjoEGT7qjjUKcAeHDNpigGwVCTxMj3ZtiidX1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177544; c=relaxed/simple;
	bh=0StIhegVocrr0UB01yU+UcOspZ1FBVgbSkPGYjz3Acs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VneW/AzxbiD1NnHPM7zVsJcYGEb2TOiapsHNdjN9yQu5oc71MqCQ/mLEwTtSOJmUqgpLeQryuMsAEhqmO8iv3zevMzKp8OdIJaVlneHKMD8W7idRCr/vC3GCz+Cg69z5nr0YJUdya2NEJ0WcR/wHjh3IPxFOKLJpNoksMHCWkUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKmGp2w4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CHN14sKo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKmGp2w4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CHN14sKo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xSLD174169
	for <phone-devel@vger.kernel.org>; Thu, 11 Jun 2026 11:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLBwXK7+oD6+XlBvQMPqJDwpfaAh9nMZFyst4JItm4k=; b=YKmGp2w4Uw9sd1Lv
	n2/3v+0Fvg+ZGtp4HTspljqxGNIj9yWFgrPQFEJ8L1HtgcHfEFzcoHO7RWeqJfB7
	p/SavtBwi/Aw6c3XmHPakqA9zb4wXeTQbm8P8nYzdLjckTD9F3qRmTrIR7wvLh62
	/+nV0ddbYvknnbcX7Mt0lKLT2nYfyhoRdg8sNdBOP2FJ8KineipZeIE0Xd5rQ5Nt
	1cEpcMoBvrPdKLg/Ml9jotWen3SSuIdKSpTNhA2qZfmwPiL7v7s6jUg++lSS1mqM
	jqVNVnQXFfaf/OGMCxj/LHjL/nJcfNTIzLZbSEDwck1vR/gx6x3pg76ISaqBo9ip
	GRez7w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6vb3hq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 11 Jun 2026 11:32:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517865e6219so17145441cf.0
        for <phone-devel@vger.kernel.org>; Thu, 11 Jun 2026 04:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177541; x=1781782341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yLBwXK7+oD6+XlBvQMPqJDwpfaAh9nMZFyst4JItm4k=;
        b=CHN14sKoGZadYc9af023CA0NJNIAg3Gk2MmLIFjhjuCKjvKdHWjbAT5J0kjJs5jw32
         udRbYPYhVeHGvdvFdGA/bfSNo5D98j3WAT+yxWDokaKPFD4s2sTHHqUCLvE1yArbRm8u
         G2i0zM2jC3mAB37fpprceFB2hpakQtQQfIYgLW4jw6Cx8sKV3YCugSq+3xljl9IuJsol
         lXsX3NxGjeUrd81QW5K/medhfkZs/miwZxdRl9lQJPkoW7fBUd/652fqpLeesTwxG/YE
         XTVhe8BeQgIAjrZctgiu4TnLHdxCoZ2Efe4lUVZziNJt/DV/j56RAQz0WUGj+rkMPS3W
         VN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177541; x=1781782341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLBwXK7+oD6+XlBvQMPqJDwpfaAh9nMZFyst4JItm4k=;
        b=aQIyhtdFtGo5tOtEGDfFQzJX3+BhK5rrgypw3ykXqo2vKb79pGIOG+n2lqG+eejGIG
         uiH0DXgwd/lpDCvGOebyyRJqOgo6ifOefktsUlQyTFzwBqMLYktdE3A9sjlOaA/XUAJ2
         HnPHI9G7W5iZ4OH0jeUW7TshojqQnJ0arjdYq+FI8c6iOyuHmf90J2nx1ZgLCOnOvgzP
         2F7D3PGSE+V+UV29AfCTjWAE40Hi19u2i0GyHGwne04fBAqgemW1DNTJ3u8ej7f3Spo6
         t6gEHfhiq5EFyGH5dC9NukIYXAMx+kGRY+peOU7Be5PlhHP20fpIXZRDGHKQgNTCw3EO
         j/dg==
X-Forwarded-Encrypted: i=1; AFNElJ+ta3TW4S4jOBvyB6wX46zyj96dWb5u1CsAuUe+RHt1qHrkyHOcxVE/gBsPHbVqXudPtJsaOlagTHUXBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1YMVWbG4VVmrMZyWp6bTqLjuF2sCi1e6vC6QPd6oGF672EtH2
	ISyi2kUOXoXCHfKZZ1PbdcLqPDr1gz007b/Om0j/YwljqyQBn8t3GHspNTa4zbb1PtK+oUgKrrq
	k+FG+bzcwlUeo8/2QFaUm254fYwCphekOY2iIAjKOhK7a3LqRVMH9fX5JAhVN1HeByg==
X-Gm-Gg: Acq92OEworefu3my7IuFii0kNqYBjwXDSLZ1MBdbaEEqgoYgwpnZEOtwvFQbmiGBv2o
	6mOnfmaC90vEztYtB2mVCpmMSu8yJSovyKhJSCeICvAFN8miNfl2qJcdZ4B9oBEC/Em6KWdwviV
	+ahLoUXFJkQSLYrmRJ8BHiTi8qamINYnoT73iO1hV8NueJRnUosl1pda6Gkib1rs30gfjsLJJNc
	lHfn/m0u47qbDY38vYuNhgA7D0xCLOTMwP//5eiNVcz3ARDoUp3QQ7hK+tjt1dzlrXnorFGPdU5
	/O9TsWVzQM6fqQqbGBdxgufxpa0kCG/18/TlU4cfVHfwqWvuH3GnUmpnbBhuX5/xT9xgrVqY6FD
	Oh19fp7FwBjRcpLi743yV/RF1RsF5DtA51L8VD8dpLpfsJ+4dOnoYGepy
X-Received: by 2002:a05:622a:1f18:b0:50b:2875:5782 with SMTP id d75a77b69052e-517ee2375f4mr20213821cf.6.1781177540992;
        Thu, 11 Jun 2026 04:32:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1f18:b0:50b:2875:5782 with SMTP id d75a77b69052e-517ee2375f4mr20213461cf.6.1781177540438;
        Thu, 11 Jun 2026 04:32:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f14cbdsm52606966b.2.2026.06.11.04.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:32:19 -0700 (PDT)
Message-ID: <b6fd22ee-a063-4af7-b21a-5f6268c65b07@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:32:16 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] pinctrl: qcom: Register functions before enabling
 pinctrl
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, phone-devel@vger.kernel.org
References: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
 <20260519-mainline-send-v1-sending-v3-3-3dd7aa125353@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-mainline-send-v1-sending-v3-3-3dd7aa125353@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: f_xdwR0WPWHzzYCyEin_X9RXQN91rlXn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX6FOi2IE38918
 +YnYYkwi00a0CmmsrNj1ukj8FBsz1gOjIalDROu7pJY+NbJzlIhU5lOM4HyqBWbxQWw8G+3qgoq
 qOW+7GkRwpL2bPuaVu2tZhX5IL1a0DY=
X-Proofpoint-GUID: f_xdwR0WPWHzzYCyEin_X9RXQN91rlXn
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a9cc6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=lq5VANsAAuRygiiSL6QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX/qCDunODxGAM
 ImMAzrTxSfggoX/CqX7GN1SEXT+JfnOULGwXXjAXRKJDWt4D3tJIctL27t3OHVdFgbznY+jxhIb
 qjXB1eo7VnZTe8+pSjCtIbNlxGOHevzRr33eetkY795OEzj7aEnXC68Ku8Z59K4Ji16gwA3LZme
 fkVEFvfjkkKTlY9PVGN1H6lIf4c/d/4OryHrj++/uMn8+uQEsxbsO7hkRAYz1JAuEXT4sw13MTe
 DdKGr5Db5dQF6Kp/OZ2ePS/2H7qRPJYx6qFdpTQmoDJh5JQziGrLFkAQurbaGMMmQrrTekD/639
 lbZg79ZSmvQ6tE+PJNHfWKuEZ58LCk46QoWg+X9GQ96/v0eRsFXCeQWbHnkAzTUH4oGI2X3EKB1
 arW3+aehkqQorBeQgU5cMMiZdNjxMf6Blp3xqSxfJDQ5HywCamX1LqYHnis0IZThc/tIz4PcmWW
 Qxr8Jf6d1cNc13hcFSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110115

On 5/19/26 9:16 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> pinctrl consumers can request states while the pinctrl core enables the
> controller. On Qualcomm pinctrl drivers this can happen before the SoC
> function list has been registered, which leaves the function table
> incomplete during state lookup.
> 
> On APQ8064 this can fail while claiming pinctrl hogs:
> 
>    apq8064-pinctrl 800000.pinctrl: invalid function ps_hold in map table
>    apq8064-pinctrl 800000.pinctrl: error claiming hogs: -22
>    apq8064-pinctrl 800000.pinctrl: could not claim hogs: -22
> 
> Register Qualcomm pinctrl with devm_pinctrl_register_and_init(), add the
> SoC pin functions, and only then enable the pinctrl device.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

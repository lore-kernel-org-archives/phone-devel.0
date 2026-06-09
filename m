Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71212416CE1
	for <phone-devel@vger.kernel.org>; Tue,  9 Jun 2026 12:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007704; cv=none; b=V0rxRuDlDFvYfdUAB0sWA/Yckq5bF0v5zOTMVwTGmf/WsDf9mx5ryFjsxsReUSTcjC/mbw+6S/7y9zFrfDqk/5nNjhh2o21RT+zSySSkd2mPa54QCT2udiG0qicsYsBkszlv3nvQ/+DlPHWnsUXzWBDa3FAb8TIs5RBf37jNHuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007704; c=relaxed/simple;
	bh=Al+O4ZpsG/tKercA/jEl/ceexyd5wh9GxKJA5iW2SWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btgMDqL4fZGbDxG2yyqNJCTJYOhi0rauaWasZ3rCL/OS/9zd1TIC7jia8L9BrQvkmkQ/gTsrTOFg5c67oqUkSaKpgjQF6R3B0F4t4eNtb39K79mODGFF1lgUEdbHV8hRcwNp6Wr+pezWJWCfJgx0j2p4uAJMr8opciiApA9cM24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FXIGF+M7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tsqvi/lq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FXIGF+M7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tsqvi/lq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659BnDlc2454377
	for <phone-devel@vger.kernel.org>; Tue, 9 Jun 2026 12:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tA5KTvMfXzI2+w13xoj+haJfk2LLPyT/kYUCzPHF2/c=; b=FXIGF+M7jddR6ztP
	Jg1qfzQKf0wnWqNx94rsO50EHvAckOVh/w/0rSpnkRZSfaJwR2SMKJRHMHdQ7IHe
	Duc+ASZjmMe1vtbJDG7gE2N17Or6PBBOw5CDkjOZxAid54sn0hHaMWoeccht3hxE
	58qxG6lTVXLntwb/QFNn9ENm94sueJredZZmO1J26Etl2pFudOc6GAtzeU/WgF4N
	mfgsKffNnyf+xWHnwgUhQGmbq6H4jFYepxghD0PPXmUEmmfMsyWpPZV85emSa7dE
	BGlE+DhxoM8WOE3QYZ6F/2g7TbKvWYR6GgMO+7JpehrEYvhLBDITYnKNvmKl11U5
	/dYqmg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4h62x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 09 Jun 2026 12:21:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91571f0d3e3so88132885a.0
        for <phone-devel@vger.kernel.org>; Tue, 09 Jun 2026 05:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781007702; x=1781612502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tA5KTvMfXzI2+w13xoj+haJfk2LLPyT/kYUCzPHF2/c=;
        b=Tsqvi/lqVLGFV6rbaLoAjo+gF2GAsllBycL7mSBZZ6Z0P1cvC197C9+af6ST+O+QtO
         cTjLwrADwBT+ARpuM84lPHAvfQPEHr/hmIsY1GGaTLag/NW/3fZnBKsFcafu9WGsKO/f
         GPzk0iexqo7h1BmQp3+nhOmOHXo5sHtfbgT/mfuNHW4v2a9Eu/WFjT9ubEMOW0q2nTaG
         w+krs6Qn7vBqFATGRsS9oWX/4aAHGEO+5woLUCt3lUYnKGEH2tCoMrkda5V0jS1j/BMG
         1SoadxaIT/+8yA15NKvzfh14ikDgpLS0QqSNrP4dLykv3snDVvz6/QKQMOYX12Zb6yNK
         qZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007702; x=1781612502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tA5KTvMfXzI2+w13xoj+haJfk2LLPyT/kYUCzPHF2/c=;
        b=Xitp/DqaGJUdBvXG8E24W7+8S1jNwHa1OZISz4dSgUjqd04qC8gGlPE061kskc21Jb
         8IK3FXZFL70leNyjmwF7OFh9F1kXeqlElotsCNBdhq+uc7dOWoeYQ6bIRR3QnqI0RLeM
         dxiEvQ2FSxgyu/zawLzm4amLMP52adTswaAXRE6474TiO7KVNwnpCEtZMuC/CcdY7pIZ
         WCfsX4TJQtUhv8lZL5VxbujY2MwIYtJxIN728nOgovwKTGNtuPJCekRs2tB87j6Y5tMJ
         GmWWGKm2Fb8UlHrdZUenULf2mrELq4g9WaRRE6bsrmdiwtPZFUzjkbeVYmTgyEf7HhPF
         T2EA==
X-Forwarded-Encrypted: i=1; AFNElJ9JBXkGg1XyOcxgxIm/S6AVu4KqhuVmMF7PguB5zz04YPCGHs1qR5tvNJu11OIilb8WQroQgUcrsa7raA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzL8R9dS0M4lq8D9eYBAkUD3tvKOw8veol3GwvixbQ6SBId+Dvy
	SFZ/NXl6m6C78EoUI5rNWB/a61+QLa3FnpE8/z2r1zS3lP+hnk5ZDRhqD0cyD0BXtEilpRNGc2F
	H9ccqaskOq8z2ytmc62LAsojkJ0I8pXtfpOVqWRuUZNX3I6NL+wlLQAlWMUxm6rVcfQ==
X-Gm-Gg: Acq92OHeaNkhFg8stiL2dxsAixHHLWlC8fS0AlXSKNks0tELcpoJNbzKbIhih+EsbdE
	GRLvuYPOMPY+/KJjdtjzTXqd6rdYBsCwPandHChgKEXVxTUZtZbYKW4T8IgFG72qQLH8YBVZ5VX
	3aGxq9BiPFD4+dg9PPt6azcOqUt12Lqr7d+ryZjFL7bEaoucwsJ11QvW2CX3HPOkCycq6/8YRm7
	w+kmeOcXRSnCECCHv3M6lTyEDJCUo29GfUdeQAD/Gp4WitWRGa8oKE3asabRNblZBfTUY78RxjI
	kXKpFWBmgYSXhfOjR6an92Aftz2H6ARD0ZTbzOlHgMzRT/QDfHLrz1G3o54CYmnCQ1BWi7pRYc/
	7KOoOlMs3PXyc1I8/NGx+gxWHRUjeWatYx94QjmGMsDhvlSvvKtBzldIV
X-Received: by 2002:a05:620a:4694:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-915e6d7a074mr264144385a.4.1781007701709;
        Tue, 09 Jun 2026 05:21:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4694:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-915e6d7a074mr264139785a.4.1781007701248;
        Tue, 09 Jun 2026 05:21:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e05199sm1006369066b.29.2026.06.09.05.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:21:40 -0700 (PDT)
Message-ID: <1d15a420-7360-429e-a451-ec1f012a0346@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:21:37 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] ARM: dts: qcom: msm8960: add RPM clock
 controller and fix USB clocks
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a280556 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=wxLWbCv9AAAA:8 a=RM3L-PboR186kqoymW8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: Umn8nt1Nze3J6DN9LpWjaVCZoBApap6S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNiBTYWx0ZWRfX+uq9J3RqKGeY
 +ZeEkBDXVTSK7o+lH19wsewCt6iyv8Lswa3AdIKhc3+dVb7WgPzRM9lVfOZtVwunnkFCWTwcXpp
 bRGYDUYvh87RHAqGd+YsL0sGrGu/M2BsvzJHfq1B89VtiOmzXb71F8qvSX2EYISEGGjMzaEkFf+
 S644JWXI0q4jHXrXlXgNwNa4ACjP7oi1x4A1jrOZogwiXzcqkLbU7Xq7i3t2C83m9YhkDQqzoO7
 0S6HoGr7RtoW2t3UNe/rrYp0Fp2mAWI6wELcfbZSuzE9iLbq3N7DjihXZX1HaKF1X6eXRK1nnky
 HYwTQRmVa6F73RP+yH9HSQmIz6BKMxKLVSudg0Lbg08RM3/cnwsWGkn2uPI4SiVQPl/OARFvxxo
 cvO0rTaN0tzIf8H6UaZSOA82EnshfJPddbSHwyD9cmAphZgQSSjwwYuA8urfwG2TtwwHtAX6HH8
 dsMRl6fgFRo+Uk4OpAQ==
X-Proofpoint-ORIG-GUID: Umn8nt1Nze3J6DN9LpWjaVCZoBApap6S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090116

On 6/1/26 10:51 AM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> The RPM clock controller manages clocks shared between the application
> processor and the RPM firmware, including fabric and bus clocks required
> by several peripherals.
> 
> With the RPM clock controller now available in the device tree, the USB
> controller must explicitly declare its dependency on
> RPM_DAYTONA_FABRIC_CLK. Without this declaration, the clock framework
> would consider it unused and disable it, breaking USB functionality.
> 
> This also corrects the previous misuse of USB_HS1_XCVR_CLK as the core
> clock. The XCVR clock is in fact used for PHY/reset handling rather than
> as the main core clock.
> 
> A similar issue has been observed on APQ8064, where missing the RPM
> fabric clock dependency leads to broken USB.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---


> @@ -507,8 +519,12 @@ usb1: usb@12500000 {
>  			reg = <0x12500000 0x200>,
>  			      <0x12500200 0x200>;
>  			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
> -			clock-names = "core", "iface";
> +			clocks = <&gcc USB_HS1_H_CLK>,
> +				 <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
> +				 <&gcc USB_HS1_XCVR_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "fs";

The bindings change you sent changes the expectations - "core" used
to be the first clock. And I would guesstimate that the
DAYTONA_FABRIC clock is not really "core" - does downstream do any
ratesetting on the other two?

Konrad

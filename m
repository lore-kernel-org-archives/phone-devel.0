Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FD739657A
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 12:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405394; cv=none; b=hvvCYakM3S0ixDAGaVqT2JIc5is7tHg9OQ+Ce2tn9EtOJL6ZgXkJ5czGuSGV45On1EljA+GW58pbj82Fm17CxmtjLV29Lfo3Mio5qi/j1dZ+7riP0twiC26D8JoZZOi09L5WJZEadnG0l0ZBM+BI9awL1Kq/v6L7h3yZJAaHcsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405394; c=relaxed/simple;
	bh=Uz8iVbvl0it6RR2xbtpvIT0/obkY67Dsb9uRtPbs0/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oRz4DNTOe7C1S5K0Vt3WQium3OQFwkm+6kKHy/OWqrXEP9wqZKVMe5vJ5cj/+0YFXf9D7C+MnEj0YH+FVFf01eO2gbzLqCKGax55Dzpv2WDkoVbwf6PbLoTL6L4YEnFvOr8fquQAZmImRqZ11uCnoV2wFFhAvE6eMVN1MX+bA4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bjr/0Kon; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dZ/av5Mn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bjr/0Kon";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dZ/av5Mn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7JSfn240513
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 12:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/3y0RmbxVtUwFPf7puCD9RfjHJ9oaX5euEbJAp5qxM=; b=bjr/0Konlb58+A66
	SY4w3g1X1s8ykFazJHiRf5Vce29A8UIdjXtef+thhGWmDg0OCjSoZvTxYAYHYj6Y
	kwcZOD4OleyFtxXGf7QNOimEEmcgjDamGUDAic43zN3CSPi/XChErZrv9cZn8LCo
	P4IPfWI3W5Ldg31FLqRvV9lANbXTqUeiH4Yb0NdJGyxxSXXZ9c2CudJMi3nFrRor
	5V+rvvILwT4yeZASzWr6AeDaPJkM9/s7XJdGasOdMEk265wAJJJv1BqcvOgiejDv
	4FC7Ru69rirPUwEs1u0TbyOjSSgZchZnKWrUvmMLK3HCJyvDplmITBjQbQ8TwMwT
	LWETSQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cve3d93nd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 12:36:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8954b9b5da7so15022766d6.2
        for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 05:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773405387; x=1774010187; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/3y0RmbxVtUwFPf7puCD9RfjHJ9oaX5euEbJAp5qxM=;
        b=dZ/av5Mnu54f2E3/dG4caJhMK42LsChcghyUFexT9hysabjy0YXnY+mQ7KLZwZ8drq
         a51Y36WOLr6K9s1Q4m/+XbufmLrKB6HpAm2qSe1PBV5vb0GIkXLkbECAwn8H/ThGkwiS
         pZ7lhvSreXp57NOq7we+5TBnlDPyRCshyL+FKCzaX4RnG4PJonLob2dgaYJ3LJp4M8I3
         lMj9JilS9onMWcQe0AXOWdW7ILe7muIIAiGwm7kQFJ4K8hKQ05RHtXdl8vHC+eW/gYdK
         LoIoqKFm8gS9i4l1+vCWX+t8E5D0RXYn3zUwLkc+8dwuTdZ2DrozZEYhum2omfATWYHI
         0B5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405387; x=1774010187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/3y0RmbxVtUwFPf7puCD9RfjHJ9oaX5euEbJAp5qxM=;
        b=f7fTUyIX/L3Iq6mN9bSEij4B8N7BktSDoaLj6DXYALxsYGg5l4mHe46JLB64A9ofUx
         4xuNoA2aSOnzK/AIr0SzH+Z51NfYtI4h1rOz9RG5Ul16cOKgz9Sdgohcp5R2TOunvCAe
         Mi4KOok48NkMdosgziD64GeuKQ5vNosiq6VPaOs9edt2Psdtx2YIsU5Qjp35yvKLypcY
         HzEfM9hSpEAX2soHT3mHMtWe5nZJ6jXsFpe3gVVMTq+UxOLuZryYEEWMTd5+HC3+yTqv
         y4M2bM8mD+3SqfqUIUTixJ0LfnuahfsYB1J5H7TVvKJVUDbQ0gh30t+zQ+2LG0eTId29
         KMTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5Gh6to+P2/Id3cIPxFBgzsrnvymC4oz8kDZ/wAA23S7wLrXL0IsQ+f16ThEJ3B+BtBKfBJX8IS7SuYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTiIS8Yg965AxKC1PLFQQDO0o419KIb7RExL+PUxzf2gTrDl6f
	0b9gGdpl2f7O/gYAyWyvkH6M2MIP4AJa+WJEB+voAk5DAxpVvmC0G+GpJ9yrX+YjCXIEdzau0YI
	SV9L9EAW3h9G4qiR211N4Ook/5Wh8ME642HEPBMyQKpTlyPqSRq9Xs7IGgOaHAIPFdw==
X-Gm-Gg: ATEYQzwb7SiNZDwW5jQ2LExaUsWBQzDLmJDzh/k4gu6vm7Jf8ruSiuI7FvL+pYNoNTL
	T4Ow3G7SdiF4rIh9xYN/11J9SXehf1hIlmjQYU65PWMovZR/lKt0SGsO3svNW5i1CQYZR9Pn2Ta
	h8Y6R8Dt9601hUW/tloMkq4AGPGOzVN24FtsX4LPboaEA1vt3T6tO/wFlBFKCDOwj5Qt780rRzu
	Autp8DbhwGoRVu+Q96HG4amUs3dj/coTTWIkszFUHgp5lTTz9on/BA3jj8xwVcdKEO9/SFCgms3
	eYqAysDJSXKCI3X9F5yxW76m7lJzsbttYAI3hDSLjoKb8MJIJZKOzgB7FS2vpZ1xEO66BH3YWhl
	oaiv/g+c59eoKUUveMSm4WSScyD2IgfnHfwnVV4P7SW3SQmKHmztEHhzg3C/vFSpasgCjZvdLbC
	y3YXg=
X-Received: by 2002:a05:6214:3481:b0:89a:732e:f805 with SMTP id 6a1803df08f44-89a82065cf6mr31259396d6.7.1773405386627;
        Fri, 13 Mar 2026 05:36:26 -0700 (PDT)
X-Received: by 2002:a05:6214:3481:b0:89a:732e:f805 with SMTP id 6a1803df08f44-89a82065cf6mr31259086d6.7.1773405386181;
        Fri, 13 Mar 2026 05:36:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cefc590sm42822566b.48.2026.03.13.05.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:36:25 -0700 (PDT)
Message-ID: <10235bd5-5aff-4705-b00e-5197701e2a7e@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:36:22 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Introduce
 framebuffer
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Petr Hodina <petr.hodina@protonmail.com>
References: <20260311-beryllium-fb-v1-0-408a580d125e@ixit.cz>
 <20260311-beryllium-fb-v1-1-408a580d125e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311-beryllium-fb-v1-1-408a580d125e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yEZvAWclKe4IoqGACkTRyCqWwwnBEYLV
X-Authority-Analysis: v=2.4 cv=FLwWBuos c=1 sm=1 tr=0 ts=69b404cb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=sfOm8-O8AAAA:8 a=o8upt4Ul7olqoy0RcUgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5OSBTYWx0ZWRfX/C6QZl9hz1hO
 LZBXdDK2JWZT0xt16hxSeq2d7BpHyAK54Xw/wxtYL7llTRisxapKicoALlEQFJog1Ie0+TcZ8Nq
 p64Yypkpv6TB5NW8ZbElt+y75+Yj1sOEwpkwzW3t2vurFjZ6ROjZJNsYYVbSQxPbpAz7+qDIT3b
 2U3KD1itz57pv6sDfPhb4yIYlXUmFwAT7WyhzTZdxlj/dFZE8tpi3LcFfeTJtYBFtyKexUZaiEC
 wmtUmLtDvgW6sD7IztIR3Vso7+/D3/VUm80M210Ko3e0VfTQKrrdmqpTAZ4X4OYyguSI/scO9x3
 mJzh3UIotCYA5hsuW5GNuq815O2uA9U9tQXi2cCcvsbuBSwdHdPZySw1sa5qLFDWv86qvYkLxdE
 dX7NQtjMajpkco09W3E9h0Kv8fZoV9J1rG0Zl5WGk3QWZaucVixyYTrp3bjDb546/38zuh2KtyQ
 nSQyJvWGNCPQVmcJmmQ==
X-Proofpoint-GUID: yEZvAWclKe4IoqGACkTRyCqWwwnBEYLV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130099

On 3/11/26 7:44 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add framebuffer for early console and u-boot support.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 01b570d0880d6..bd6d7a3cfc0ac 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -39,6 +39,22 @@ aliases {
>  		serial1 = &uart6;
>  	};
>  
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer: framebuffer@9d400000 {

This node has no 'reg' property, so it shouldn't have a unit address
(after '@') either

Konrad

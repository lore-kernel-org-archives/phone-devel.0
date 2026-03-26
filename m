Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8433446CA
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517952; cv=none; b=YPMI4wAgvQATBjqAvoXSMd/LAwRG7wnUYz8rGsjMjK3hFwgXBumHcy++9Cp2mRqybUImH1Zw2KNpp9nOtskqZw776tg5Bhh61oqED3E3IQj+dSslUNQS9Ta0+lIa6QNBIcVah6yBVQlmNqOZoR4ON+aDq913opD8+u1gEXIcWnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517952; c=relaxed/simple;
	bh=J1mg5KuGxeqiUBfNMxCkrcsh6ySIvujpPY1Sj3t3DAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5ktTdT4CQc8FBp+30paW+Q2lF2zgAqAMGW5qU/T6TUgmyzD+Q7qQ9QkVsVBG/mCdbR84i/U6c+0QIlA0ZSS79U9LfIxt5Uqm9/v3O9XCgRYRrJtuIF+dRINDROygR3BcTe1mLWVKegZgB8zhgfUfTF4X7d9wcHw5H79ZqRcJvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1yERFpI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DnVFsRld; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1yERFpI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DnVFsRld"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6bdj51175749
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 09:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KvW9fBu7DU6nm/PicTUYBmsoJAbT3p9HbjsVvtlEcxQ=; b=J1yERFpIYWGjXThP
	vcGlE+YjOw/+YUu+m8re6aIf5FgpZaEmoTX1As+BiG4lAMbcA9wsPkR1Z6bY3ZEl
	tLcy13GWffHxRUvLqyOvhjXVz2FSkp03EGp/nA5X7DLGn9zKe44h0wo1ExPhI+eO
	ck7k71QIVEV1E43UM3e53Uimfv/kKv+F5SYj9milaIWp/rimSQOecHidlC+gF9jy
	lfr8HEOu24qbaGoazV6pFabGhaqk0TbGLXHxPrgkXif6JgStGP24X/IMewwBfAYY
	B591IGEx0VnLbIEMViZoccVxqCD/WEw4hvhD/MflvmUx6WjSHDvyCFvoDuWGB2tE
	AsXHpQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q76t6m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 09:39:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb50dfd542so25423585a.0
        for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 02:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774517949; x=1775122749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KvW9fBu7DU6nm/PicTUYBmsoJAbT3p9HbjsVvtlEcxQ=;
        b=DnVFsRldAVWgGdGFhoFYmdj2EbQWsiJcZStNAj9SzziQF4YJCWLrLWPlUSUiwMurUH
         UpN1VVUvhbjWKXl7C4lRlyBODE11u9dqNrwZFfsqHcUIqQ5+exa/Vr/6OMRJgFXmdNVi
         +K6Otl2k7IV9hfwChkhucdQWK7huOk84ivI8NTf3WwR8BheoTbo6sxmllBiG3G1Lnwq7
         6D5n82nQEZQZTGvJZ7izI6dxviMGdK5kFa/KTNfLqBN4p29E4p3yN3/Qmz2FiKd8FATO
         gM3rMw2z3uSlwYHzrrvEk+DjcYDSDmukoTixg4eH4uO9HBlbgwp1+mh9ozHJZwMQUX0O
         mTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517949; x=1775122749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvW9fBu7DU6nm/PicTUYBmsoJAbT3p9HbjsVvtlEcxQ=;
        b=HyQMOEkkF+U72nHXSEHwxd6IO0RDfZEaVMHJyAGGIqKTXCpMhVHH1p+84XJKjFnfFx
         1k0ziXGz6+8tcPSJgfYtsCa+ko4/+6B7DDhKhh+dYfLY3DEsXT1o9n+/uT9CYP7o4if/
         VBQOqI9IAu8bd+nDJRe7FVlcO6hsb/iEUA9h88CDW7WN/467cXxf7VQfsMuRF627kNKg
         TpQTmzzxS2DGLGm7RfPp4IOWmGxZbXzspxCURCBSwqDPn2+XAa20EgM9wB7uHVBNBcDZ
         c8PTnY47WJoJx7HEQvUwrqFWLXbnli4KGoSZORvbbiaX/BHA4YBEHIKm5ED9/fh1gNVI
         pMRw==
X-Forwarded-Encrypted: i=1; AJvYcCVlU5COW2pB3CBIuf9pJ1yiKuvoj+kkoHA1J6Zh10Pumb9IjH8us+wgsIwHOkUDGxdXZC+24VJaPIcwUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/sZfE+SHGvMBE1hK/NNqHs836GJdYJKyrHpL4/ZzhniJ4knUK
	/bF8YIcJ6wvkUce63fRUZej4a4vF7T8B6jVCIb7Y880l605Y/byi8+GrGqeBzyjVMj/wCSMW9iH
	B2dnVVQZxd0bshw7i6UHYNW8xLzKvWF6J5Jxc+ZK8W9FUa3rE4pY0ZkLhqI+eMLFN7Q==
X-Gm-Gg: ATEYQzyYFRxZr9V6sD8ObVCJ+guegxGrakyhnYHUNUKTsA4ZCgsai6Lovm+xJBptDZx
	8q6xw4Wy/3iOXI4qvChB/5zgZpoCVZs0VJ/IwivGreE8kfnIr69cJdthefvflC8BEq7tFVo3Ht/
	3TkvQpIVfpj6EckWqWzC2vAcbb9XMj7srOvK4aFykVOU4WxBu1SdU4YPEJ2tzZqazszf9Dnsyx3
	0CfIilALzK9hw3eXOIuvjzUv6fAmK9yz9ObS/7lm1cAcL4Xe2r4dqrXAVrZX1runid5jF7wJsgr
	GqkGeCbL+VpKqSOshJG5PpvN4FFlM4tl18+RiiW0CyDrygV1yYe/b9cCtvXInkSrRGiD+N8qFrc
	0x8dMhB59PBp0y1E/91OU9ODvl62vZFQw5I2dNsD6+E2TI3JvQKrzAfRzLw4GBxBBOFwoHyEG7O
	t/Mgk=
X-Received: by 2002:a05:622a:5b06:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b80e73582mr64090011cf.9.1774517949404;
        Thu, 26 Mar 2026 02:39:09 -0700 (PDT)
X-Received: by 2002:a05:622a:5b06:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b80e73582mr64089941cf.9.1774517949015;
        Thu, 26 Mar 2026 02:39:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b202663c6sm99356366b.23.2026.03.26.02.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:39:08 -0700 (PDT)
Message-ID: <c324b4f3-2af6-4592-bfd4-2b78c7231eb9@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:39:05 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632
 Type-C property
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-3-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-3-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NOPYOk6g c=1 sm=1 tr=0 ts=69c4febe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=QifeDmTRV7nuaQTzNMIA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: u3FJZ2-3wqir0YUsZoP6TUwMuc8Pn8zq
X-Proofpoint-GUID: u3FJZ2-3wqir0YUsZoP6TUwMuc8Pn8zq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfX1HSYui+oPYCF
 ppu+A7IuVQPx7Xc+Zt4xvdxaKtl8uH/xUqfj9T8o3+hDqENdej1h6wAdbIe2VsBX4SJQJ9iqMNh
 VCtJqbV76SJFL69TWEOmw+Ym7r09HA8hKkXUoIMhZeTI2V0nKWWUJPpATthenYq5rRktyEG2KH7
 faapdjEoELILlvlM4oCG9Nmw+T+/+4Ti1XfFjYLTb2FKp2nL4MsSL3GRvvYpw5vBBPlzWhnMRPi
 e/6OsFplTQXVKMNzdC1lMT72fvnDJJw+zaAvmiXdCNiZalbQcEqL3JUa8ibpzeRzh3bga75qtzF
 R/gbQH7cg1IxgAq3G5YmXUt/0Qpk8VYd39qmbQG5jxWW8VwXil/u7hmi+Q2Rjwx2/LYVfc3uRTe
 /lqGJ0R3Gjfx/85Z7DY0nXsna7Y5VSOuLlFDqTuiSilrxB2oxRdpN4Zjq86Ehp+am72E5rRvBA2
 GxsUBlOszLA27n3tZPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260068

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> The USB-C port is used for powering external devices and transfer
> data from/to them.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

[...]

> +		port {
> +			pmi632_hs_in: endpoint {
> +				remote-endpoint = <&usb_dwc3_hs>;
> +			};
> +		};

I'm going to assume the SS lanes are not routed

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

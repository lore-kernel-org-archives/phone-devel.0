Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623165;
	b=SBKYsxhM9FuiDysLKBTzKgTmh1msa7zKh74L2BdmrvO+zs3wUBiu1WKxs1cs2wihsGGQ
	 cdr/ZyGIvs5SpASNGHEAPM5UQjWdoxCwQCGKuIXCXF8v4k+AIgiwPCYyyL4jiLyNXJkfX
	 PBXqVEu13u1CnlprQiS+7CgrZfGQIp5hLVLk1xat3LmHxwYnaoemSbeR8UXoeRNDIhD50
	 htEZmwdhcXyCPFkEM6fdVFAC2LcP3m3rnAAiAPt3SCqqsM15cnBc/071/VQzeFDbxRKZC
	 6MyNc91xE09zI+JvxkMvGPPOTmemkOsGKjOvFcSLfjC2zawhjiECQNFSPGauUVYH7hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aGDvSGUaUelkvgdt8SNqfNdrDK9ovbfPV8d3W40UaUs=;
	b=M9TfRFTYgIC9ZT9/yALXo8whpxB2EZ62qCXdBBy2JVtjP6CqX0XvJsEoe/ScZommSI9d
	 gFJUyush/c/PKgOlG2vuIa71txzxNcGkB3aZLEP/KYIVuCEYe63t5ktWXHqQfPepVzKnu
	 ubdcNa5WBJxIVYIPxHy9CfsyzonaS1oSRu39n58EUg+WfkSk/84vW6s+Y3Vcx7gWgKN53
	 WMT3tVW1QI08Z4Vlvd77OEQNEBcFiTJ3adV9RGrKfB5OO5vQJYeet4MhnSQP1yYSPFDu6
	 ZJY3z0MSZSaUuxSfU7Egb8OBrqAMG/ZhAzh7SUEgObU9UPjHOk73zFsoto/pbvqAW7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0saIndc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tpnfups2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF729606A327
	for <phone-devel@vger.kernel.org>; Mon,  2 Nov 2026 12:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF729606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0saIndc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tpnfups2
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AEbx2467034
	for <phone-devel@vger.kernel.org>; Mon, 2 Nov 2026 12:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aGDvSGUaUelkvgdt8SNqfNdrDK9ovbfPV8d3W40UaUs=; b=o0saIndcVHp8vZ6f
	CZ2rkVhjH6ouSd/s4V58y71yXm80mPHeAGEZO+CC0GP+LnpJ9lCUFhD7KjU0mpol
	LhVJHiTkF72NE9l1LmUq3b+c80HrkvP15aK90GU2lJB/zwQOfZqylENqYUtyeX3T
	AU2f5gRStFfAqYDzzvyjk7lLa8GfK7f1LNdcYXLNO11BPKqQtLcgkmyZ8Xpsixgn
	g37lQ3M1AHJJonE/at+vRCNLpPUe0IyzOUE1/wTnknCOiKOrUGj9i/319/V2CvHM
	KJxzu1UhoCsqrbX7DDFAWEqBWoRlU9cGIIM+8f3H1kFlqq0kV5l1Wqm0ffwKkjQG
	GNbzDg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhts2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 02 Nov 2026 12:39:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-536540909e5so8622341cf.2
        for <phone-devel@vger.kernel.org>; Mon, 02 Nov 2026 04:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623158; x=1794227958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGDvSGUaUelkvgdt8SNqfNdrDK9ovbfPV8d3W40UaUs=;
        b=Tpnfups2+QSRVb7I1L0nKeK6XuBUsdWasskFT6gz395kizEjfAjtra6zsE+NL8Py1u
         3CjuXVj0dZYKlzPxR/8yRmyRoapKU7vIliy+5Y9pHcdngkK2UX/r+TGQRWK2Quk5f1yZ
         B2qE0aJzewN0aMeHsK931S3AgGDOf6Ywlfvx+uK130x9MTvo/RPDbhp7FQokaZeTfBct
         ugxJjtSyhI3MWAJjD/RYVAE9ce+AR3mXwTqRer79AXrK2xeTZRvFpDCWBzInAO56mZKN
         RwY5TtYITH8d1iaW4BEjKwH4SFPuBoyxXYPW9BLlPZlisegm6RUArGKOrZlsAe5zC3Dy
         rF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623158; x=1794227958;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aGDvSGUaUelkvgdt8SNqfNdrDK9ovbfPV8d3W40UaUs=;
        b=gVIsSFpkiTFj3mGkOuNvrlpgVnR/8yE1AWvzcPDQkN1qLLwGSxDF9q6kdwakOP+tPo
         Z4uLOJyMxSY9lVC3RF4qDBHNZbJ0r2k7wMe03gcwsbGkshxvNLUb/ulYCu/RWB4pFyqU
         a/wW6Db2HmHjBx+smtE3flbACtlWAE+BSL43Dlhf1UCqjrM6iaFcp+4zGzICGCqhqnDs
         ElNSGw4W/f3fiKTw8vS1pRHh/EiLkXco0mswtM2HmKEs1ReP7Cd2gIS7kU15F76BOMZC
         OALUmH5R6/4Y42mpL3PIGVQEPdrlIrEATqVnqhqtD92odXdkqiMB+QEP0J9UKK6KgMjt
         aEwg==
X-Forwarded-Encrypted: i=1; AKwUvBz23K9PGZT+lzLk/R4QV84pMZYutrbfbn+D7EYbR5uV0TJLTfYswAkC6Q4QriJ5+yAV5dsgtY562Cf2FQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLfSCnSi0RGD3n6lmp9YUq/t0+4ZKkIthmY8PJXOAjU8K1/hTzZ
	ILqs9vAnrah+RHQDummGgPbyMuQ8EHni/gxu0aC3nnkaKpgPmhQtx4tylIagmBw0yPyxBcvJkX2
	O38ryMFu1n+o3JhnCEso7QgSckZckFzK3DFmycxSd2carAg53bliyjIwiqfo0rl4e2w==
X-Gm-Gg: AYBFou2xbitaWfcSBjoaYj3VF9ZN9qcoz/M8JWnCq45WVRt/VUWwcFpTvuNmBpquDQ2
	RM/Zg+NU4uqL9FnmxG9Bkol92Uj9cmIz5W20B6ZKwwRG4LPs37Utxisa+1+zdAvquBE2tEfbefH
	LldsBd5Fntmf7/t6LUS7Y1xU+SnkqSMe9/iVacHyVUEX46HAxhroZ/sPiGqQqYLV4U51fS9iiSK
	5syIRJAQ3kijDkNZxywLyi++XK1dYxrM/C5aa1B9VQCUwsbNjTc1kmC6VSa/LKWGh0vFkwwGYJR
	+Z3lSZRkHYmV1GZw0rsZ8AbeTAgzox2U0nXiqov5pzDc/OLu7rpXinb0c2qQo6lFY9ozM5MSbJB
	XdT67IZxo3M43P397ZS4QheuGCCXTJvxToDQ29htOJBNhJfqgOuX9ZqR7W9XdGPhfrluu8O0=
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1815614085a.3.1793623157910;
        Mon, 02 Nov 2026 04:39:17 -0800 (PST)
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1815607285a.3.1793623157435;
        Mon, 02 Nov 2026 04:39:17 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbebddacsm23222831fa.6.2026.11.02.04.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:39:16 -0800 (PST)
Message-ID: <ee443167-963f-4a12-a49d-0b4523afc14f@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:39:11 +0100
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/11] arm64: dts: qcom: Add initial support for
 MSM8952
To: muzafferkadir@mainlining.org, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Jassi Brar
 <jassisinghbrar@gmail.com>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-remoteproc@vger.kernel.org, linux-input@vger.kernel.org
References: <20261030-msm8952-initial-support-v7-0-ad748ace375d@mainlining.org>
 <20261030-msm8952-initial-support-v7-9-ad748ace375d@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-msm8952-initial-support-v7-9-ad748ace375d@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rc7PDWvxhILc3bQsMFa-YORte6y1BYGY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX1GS6V77chcZv
 gnfEJknoEY14wFzi0REu3yjRbJRMa+1GRGr1QD/c0nZfNz1gYeQ98gqSQHu8mVRtL/8grujyXp5
 JW/9sAH1ONsqWn3TKxJd7J/BNL9oysQg8XKm0+bXi6zVueLVVUV1i/msL5HWTazlXI1cTNvGmHh
 9z7QqCyadD5bSlhC9wODfghy4ZGhR7i7vLD0ls1fQHEXD2lbtFTo322qnxBQ+oucFK/plcK2GbA
 np8eYNo8ucgM60tGVYa4chcKPSEiJ1+pbzEUJp5x7xrfLR978C0DUmYeT2MdNwjEmqq9nukmwUZ
 MZpgywfc5kuj0fK239wB3B5TyYOcoypgz/7be4XXE956folc//Rwk8h0tyQPK4m/8aS01A9ixUW
 9bEyiyWHXyeqkZXwtwO/t2lsHzRR9In0STIjgo4jmxFK137gZ/2OPJcE8V4nn5KdI0ympqiJD9h
 rp7PrTCfNlT7vtqso4A==
X-Proofpoint-GUID: rc7PDWvxhILc3bQsMFa-YORte6y1BYGY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX7WJ4VQfmrxiN
 wI+pTujvponvkfAYE/E3N1M3j7OZ/5HTtNaPZf6WsFxK4oOCMWYZQN0K5DJrG90RJzx4yDclUra
 0pgsi25zop7Y8AUPrNXyTGSg79wxEv4=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae88476 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=OuZLqq7tAAAA:8 a=MxLZmUXcRv2kY27zAqIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020050

On 10/29/26 10:02 PM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add initial support for MSM8952 SoC.

[...]


> +		gpu_iommu: iommu@1f08000 {
> +			compatible = "qcom,msm8952-iommu",
> +				     "qcom,msm-iommu-v2";
> +			ranges = <0 0x01f08000 0x10000>;
> +
> +			clocks = <&gcc GCC_SMMU_CFG_CLK>,
> +				 <&gcc GCC_GFX_TCU_CLK>;
> +			clock-names = "iface",
> +				      "bus";

The robot suggests this is missing the TBU clock (and also
sister iommus)

Konrad

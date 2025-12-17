Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5548342148
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765973681; cv=none; b=LVt4dHw4Pm2dxSJjAD2e1N+KuvmnnNPPoDtGdy/4sgiSAX5Dbev8oFc7HLeXTxpPkng6jf+1t+DzTWXUap7fMpqZxhRttCj0f3ihbLjtp+ZZwsdRB4qWhvSP1oNETL4FDrvEV+djTBeoQiMcy1W/TtOyjkIbzaB+cwcPWiqiGF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765973681; c=relaxed/simple;
	bh=FOhOqH7toKWDzEVlR9pUeDZO7isCrYW9YHhCfh7mb4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hkAS5Ma3YWj0fso4bCSyfKTJmG8VxAD/33/1CqOPrfNqqzdRCkzpneecVn8thxXcLUKmwmxa29QybnSzhgyXVhi6Io3FYL7t7+MUtUIDwDh20nvTscn3X6gDIxD6qL8yJ81uUpL8zQyb0HskbdkRWc295y41+PUvxRF5C9tG32I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZFrSypy5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DzNcqd9w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFrSypy5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzNcqd9w"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCDUFp3031931
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 12:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TiIbU7CAhhv+5oiifZDjVX1Qm9RbZdgxoYbJ4QOuiwo=; b=ZFrSypy5utuA2YbI
	hI8cL76CIrAck3oThQeoP95f1+GFPSx7sQFPCz3grsZ/eH91tuvM0GyS+Wk+ANJs
	74NsKs1oenO2QQtHFUvYJuEW3/gyAt00nQnwYoSKip3Hw/dCkREL2hs+CBFHh4+l
	Uv5oyCqzcWOB6rLSfOxpF0aI514PvPGy5QnZl62UJmumw8zZbPOLhAmVdQG6Vxx6
	GNa2JUE6llKuxKckHwVDRBUnimC+CNsD5HquA56ZqKzcz0sMFV4DTxs0bc3NKmJ1
	1rjtN/CyTXi+yIBveOlLhaCbiZJGReais+zPbBPh8nN72tIcExM1htXrOb5C5/yo
	XkcCjw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3jgq9vgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 12:14:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edaa289e0dso21796921cf.3
        for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 04:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765973677; x=1766578477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TiIbU7CAhhv+5oiifZDjVX1Qm9RbZdgxoYbJ4QOuiwo=;
        b=DzNcqd9wdgg91+8wciqJ6aareK7wxNv10+40Afrcnrjou/bR6VvbcHEX2V4QivL/nY
         Azf4Sl/DcLhMIAkBMk9CMaL+UgvuQezeQfND+fGgId4S4X6j4XXsKNLhz+JGxyDr9N2Y
         V3fmoWG/AE/6bKp/YJ075YMLPVRmi9cggXDtoIkmSACeBHPF7L8UZd5GI68MaK5dyHEs
         ryBDIOVPoeswan38pxfwpRHadyRcdHvpKFs0SI/4vz9nGMwOBxjpSB0TDZ1cJEjUR9jE
         qbi9I0VwTwwjnEPQ4tPRhstU+gWNBh8kx/aTR65n9g9wGJmCO5fgNizoI6BHexlZXoRI
         fKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765973677; x=1766578477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TiIbU7CAhhv+5oiifZDjVX1Qm9RbZdgxoYbJ4QOuiwo=;
        b=pGcz2CcnrpgOe1erYMXCJDTmuYT+xqvhiZCzo64IISNUtqj0VE90x+ZkWA7FL2BGtF
         UBWg+MUTEgQknz6OyzoMNGI8YuCsX0ZZwglKcZ3LJC/fF/NUsYzHCnS60QTteKG9lQfN
         lYVhqi2nyFSFxKpqUsw+tUdpERX62FCzPGUqPpDovJLFDXYLZUn8Pu6CFjLux8G4B/7h
         HhCwT4bziuatachwSkd7AgcYK0S8eStuHpmZ5wAa4xGFqXBCPitqxexxfbrGwBmPxm/o
         e2tCa+OJHv7XywUAZ9Pjfz/rVGgpv6h6rK6Sa9QAN+TyNOlHfMWmh9VZ1VDCa/1Et8/m
         36/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3YihZdFlno6f0WkuBftC3r6KRllpnMShhy71K31+1y5V284SaEwT50xgfKh+bjHJmBNp25P4rL7UdlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYOI/JMMIBTgdoejGR/wsOxq68hwroHHJl3wPD1fswEmeurLO3
	diPGDGr/t3FOmqSGKJAIP38wkyolLqvtAl3opjkiScrFrRi1JzmD3GctQuCvZd96U4PAgNybUVg
	HV2pCrJwA/kHBtf04Mx/o+uLM3cPODW9J0VNgU83oyv/+wsgsSuPjawCN+cg0XK1gLw==
X-Gm-Gg: AY/fxX4GkL3L7ATkFRGzwRUxgDVjOWa5RozxA+KnXmoaUr92soNVBshsBl9M2P+7HbU
	eJb/3xlfmznLMxMMUSSZkCOrIRAoFEcojxyZKohY03FveYPias3EPYh9oi5SQ8uubuk9qAKaHjW
	8Y9Xf8G7A3g2D+s6SMT8K1quN71Z0jG5dSKtviMD+fy1PNKg1gu/8kuo9q25sxtpw1OgxZxHQq+
	tAHzmx4j5J6RzyAtIQEjwqcd2W121cmbSXkbLXTkU+jwtwF6AtCt/4Mm2Zsu7Qgftpe1hRDcemQ
	bfVutDEOLxkjW6tmcNIKhCrnmcEKjmOJMwNUrBRgDhBBPPR7RPcFqW78OBBDy5hHq/wJTSJnXEh
	UdrTKRAq0yLpN06BusBl2qld4CkXTobe4XTGVcEH1L66jkytsRHlx7+pQ5+ZlDCAlwQ==
X-Received: by 2002:a05:622a:610:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4f1d0655504mr188695251cf.11.1765973677011;
        Wed, 17 Dec 2025 04:14:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXVGpRhIxu3Mf8+ixHHNkLitg1sBzNFn+khIqfYf9Z5J9ROjGkK+V2r9lo/OeYRDeOI3YbBw==
X-Received: by 2002:a05:622a:610:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4f1d0655504mr188695061cf.11.1765973676600;
        Wed, 17 Dec 2025 04:14:36 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2ed80dsm1945925566b.16.2025.12.17.04.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 04:14:36 -0800 (PST)
Message-ID: <8466d783-faf4-4b33-8822-1477cbdec288@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 13:14:33 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] arm64: dts: qcom: Add The Fairphone (Gen. 6)
To: Luca Weiss <luca.weiss@fairphone.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
 <20251210-sm7635-fp6-initial-v4-9-b05fddd8b45c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251210-sm7635-fp6-initial-v4-9-b05fddd8b45c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VLjQXtPX c=1 sm=1 tr=0 ts=69429ead cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=deFlHvtSqnmsrBg3ijIA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5NSBTYWx0ZWRfX0Tz2rmkpL0ZU
 zgUuW2n5VRYwV5kszOCucl47NlExT+qIZOEhFUlq9J+tRus+6T4LS7NpzvvVzVyTv56h9LGBVXt
 oFXHnRL8triCCr80MEmEdE5A24utD7Fyp0MqzE5m+FnuFVYs0lahbp6jCMIpjhyS+SM5LVD4vdb
 VkBRWbB/k/zE5I2Ek+DhCrQu4wlHipTbvZIRlMfbyWr2rfR0lJFMo1OFFshKWvJHR9G00dpaUcg
 +mVitY08fGkdzMB41wjEqs1++8gPWO4IUXJiPQuI7q3Gp4EPoyIhbzp0wJy1FAr422Ro4uSMrM9
 irnHi5aAMa1zZ5PwQR1hINGsWbJuBLOyP+tku9cc1sRA9JqZVakpyzTRtw/nqULauT95NVzZRtT
 7NGuohqE9dknldLK+GUrOefvqH1s0w==
X-Proofpoint-ORIG-GUID: VG_1MJHtvjv-wSzPTiO7ZZttHdiP7adt
X-Proofpoint-GUID: VG_1MJHtvjv-wSzPTiO7ZZttHdiP7adt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170095

On 12/10/25 2:43 AM, Luca Weiss wrote:
> Add a devicetree for The Fairphone (Gen. 6) smartphone, which is based
> on the Milos/SM7635 SoC.
> 
> Supported functionality as of this initial submission:
> * Debug UART
> * Regulators (PM7550, PM8550VS, PMR735B, PM8008)
> * Remoteprocs (ADSP, CDSP, MPSS, WPSS)
> * Power Button, Volume Keys, Switch
> * PMIC-GLINK (Charger, Fuel gauge, USB-C mode switching)
> * Camera flash/torch LED
> * SD card
> * USB
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

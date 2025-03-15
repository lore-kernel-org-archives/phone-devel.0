Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BFA1FC0EC
	for <phone-devel@vger.kernel.org>; Sat, 15 Mar 2025 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742045857; cv=none; b=JlVt/wnY0uwDG/uBJZ8oRQXHxJGAgMr/6AUZJ+dOkCCiJuMimQ/RRy9eAinFx7/uhHM1N0iseo1zrkXEg9R5797SEcm/p3CFSFaChMBnTCKrklBE9A/VDKEy7wCchI1iVcR1bi4YbG5d1OC/99yLICWgRD3BiyXxmKiZyDCn8q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742045857; c=relaxed/simple;
	bh=M7HCNxc6+ULLaGJ60tqlxMwe2/03GnpwEGTUEfOUeSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qTSl4+VvzceFXK2W1WhrsZ/F8rYrlCzdQ3va4UQS17J+hK4bUz/ubQD0wNP64vHMmwPYir6PjExFJxa3gVJWB0PvrEF22gpQz9Pw/oP5ciKq+OatlBvAmsFob7E613B/FTjnB6sngoBzOJCAYnfqBHeE6wxdN83r0cgLWI8T87k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fBkd3Wnk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBkd3Wnk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52FAqmJT019969
	for <phone-devel@vger.kernel.org>; Sat, 15 Mar 2025 13:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6DWUpv1hI6Be51QFuZOBU9rLiz5KUxl0EDZoZvkV/0s=; b=fBkd3Wnk4IOKpolZ
	HKDSZDkKWvr95ITEgJQ9hmEUVDtop/Y6bkNzvEI7QBYOxbXv4TitOncMlMuUo2If
	fhTn5Tl4YrwN/fbhacLcbP400HpuanLuxsySf59GcbK0ck0RIvievfbRYMkWlZx5
	dw7sRhNQtjJJ9CFtq+lelQce70XMJK03va0getE8PVz4cnYsL+tlG6w1aAeX/aRc
	UgIoDk5lGTGACo8/BlLOOgJjUs8P4oe8VVkZIXvs5mNeFcAxYGN+R72sMddcxdqb
	towvq80/Hwx6+/H1F7JU+DwcOZyOyF41pp2yhcQLKjzEvKEOdt3B7LkzGZuBaxDk
	h9D5Ig==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1rdgr91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 15 Mar 2025 13:37:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54734292aso36462985a.2
        for <phone-devel@vger.kernel.org>; Sat, 15 Mar 2025 06:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742045840; x=1742650640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6DWUpv1hI6Be51QFuZOBU9rLiz5KUxl0EDZoZvkV/0s=;
        b=P6f4cckzV/ux351Qe2qW3zGwUW5TLTh5t8TZHNd/PsY5aO8ezcTG36bsuIFi7sWMNe
         KAApyIRaOT/UHEzOcHhCnpIBGp/51gUH79nJ463VCqhSHN8kReNy0krJijNxLT49rUy6
         YCxm2iutp+nw6whY0zyjEbZblFo2DbBQ6ZV0InMgh99zYRPKx+1oE1kyd6y2EGwVpe+h
         lAK0TbPRDnabXOGI223dWj+rZ6j6TjdPGKQRZJ87j+Ck8J01Kjyr7k4nkcfoDkeyeibd
         kmc0LI0mTTJY556f+VBfceGDT3zDYYA58n+mVzknWSJoJc3b87dfNpHwGyhAL171e/P9
         v6Sg==
X-Forwarded-Encrypted: i=1; AJvYcCX/Llo6bYnRF8Af1hWQYIfJLt/e5Ygh1O59zgedRAKTmG1c46vlMCuEab2vBhC1BnOIl8ye5UztCoVHmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwykUyNxciJiUdZN4i3q87PjX/EHTbwe6Biz0moJoBK51MhKUVQ
	TpodJUEvx8NLk5MRIbupHavTtwsWBKxlROiSPoYkARzUMRSl9EMj8Ko/vIIFexi4/64op6Ajdbf
	n9PV1zLSb81PMfm7mn2R5FTwKtJN4Q4J+pBr/3ZKF2jTWpW74PjDDllxmHxW6CA==
X-Gm-Gg: ASbGncvrjW6oQrJe4EPEJfU9v9Nkf9YKOGIWT0+TewgInTesJCu9tptioF1UEbKfbx4
	vVGDp6c0zR68bFumTfXvGa8y11e4fLq1EDhjDqwZZs3ceLRfDTMrvXM0bztDHN/xd20KCIYuQYy
	s/JEPiMbFOetlnJth3UQUROSntfZeio4JQTYGSNIcDAEx/va7zIT/rHZinEbNWSutUsMydXYlZ0
	pSr7yWPIIebbl5GvF9dXwCwa4K9ZEc4DiaEQbFocdJYp6Ztco5tc99wolstcn7Cq9SdxAHxcXAa
	bgneeK3c/a+/5Gf9Pura9laWSWpVReqcquSDVq93x0YZcWBOhg9/g71LOxr/NZSyBMqnSQ==
X-Received: by 2002:a05:620a:a10c:b0:7c5:18b7:4f25 with SMTP id af79cd13be357-7c57c80efbfmr243595585a.9.1742045840321;
        Sat, 15 Mar 2025 06:37:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5IYQOLUaJk0sMyhujqGoj6BeptOau5msBzGVpujPDlMP4SRkuy4eNYMV6ySVlRgZ01YD6SQ==
X-Received: by 2002:a05:620a:a10c:b0:7c5:18b7:4f25 with SMTP id af79cd13be357-7c57c80efbfmr243594185a.9.1742045839950;
        Sat, 15 Mar 2025 06:37:19 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816afe25fsm3217460a12.78.2025.03.15.06.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 06:37:19 -0700 (PDT)
Message-ID: <a6779d4b-d4b5-41c8-932a-62cd17c9d021@oss.qualcomm.com>
Date: Sat, 15 Mar 2025 14:37:16 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Fix domain-idle-state for CPU2
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250314-sm8650-cpu2-sleep-v1-1-31d5c7c87a5d@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250314-sm8650-cpu2-sleep-v1-1-31d5c7c87a5d@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fe83xI+6 c=1 sm=1 tr=0 ts=67d5829f cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=pUt0LEAnZhKoKCINpSsA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: gu5EFESp9w8jjQDMZtYbyWgnsv0ArEOh
X-Proofpoint-GUID: gu5EFESp9w8jjQDMZtYbyWgnsv0ArEOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-15_05,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503150097

On 3/14/25 9:21 AM, Luca Weiss wrote:
> On SM8650 the CPUs 0-1 are "silver" (Cortex-A520), CPU 2-6 are "gold"
> (Cortex-A720) and CPU 7 is "gold-plus" (Cortex-X4).
> 
> So reference the correct "gold" idle-state for CPU core 2.
> 
> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D055F37DE86
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 11:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774265724; cv=none; b=EkBljjXs+fKBDRei+zipLtNSlybtljdmm3JXITtg6cicuQyj4CGdGGci9PqkB94KBmHbLFG4zvBIsp2cYcfkpyhUp3QRbLc3N07wH2BdqcUfGtkFJOKtfSEwRyMUEgJ8JTdFA6meaNFTDS4KJmpK+tt5nK4gJ+1dUf4qvxRBk6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774265724; c=relaxed/simple;
	bh=xDPmlMDXeL3lxfgUwJ6Kd1KI98MjSx2OU5F2knJ/FuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ua7RVq+EoEUx5mfOOg5ob/tEsHfIvYN+0mnf4FAxCQkYdV8Ta+yR6aAutsPoQpog3PNpmAiLY7j80rqUCxbydbg4zhkB+iMO1yRXyk+RB8+RrDa1TqLTiNXERRWT/hVBuswTddSwP1pjHNCpkqvn/iuffd/gWXm6BWFm6ATSE64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7f0gmCt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPg0MblB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7f0gmCt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPg0MblB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NAJqwt1239142
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 11:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6wS5LtayeZTbWa+/jowDNFAN2aTZHLtBtVNHTSu7Goc=; b=o7f0gmCtH/CDJQer
	Uzu1ls1dWrprV1Eu0TfZoj0LGizNlvHpmGL0pRDGcQwqsNyBYPd9xJ89ATQPBBHJ
	jtu8gKZiU6IPqagOAWGFeoW/wir9KtD4c+pFqm/tm5BRRATdmp/93fkrRo+P96oE
	CyBAGXQ0hvZvMztGGqvEPyuniL1CEItyEnPQ7mlTddDvlcsM6cA5NxeH4ZfYbrf6
	NAVIc/ytCcc/ZyXr1p5o9d3RhrGesFi/DOsG8+WYBeqewTRLccaK1WAhjdSRpmkf
	Oh16AGtTQ1iUI48UuOS0WuUdCseAoYGKcN2pUN4ckpZqmpBSWhf/qzXil/NYdmwn
	1XlOcg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jb5n8gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 11:35:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4bd8e77dso16920551cf.3
        for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 04:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774265721; x=1774870521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6wS5LtayeZTbWa+/jowDNFAN2aTZHLtBtVNHTSu7Goc=;
        b=NPg0MblBoXrLKdLf2m6vQYDMJQcwRAWxjrs+uhSY6/AVkmRNd3qFHsxPNXdwaDtqQr
         4aut/qZN9/UwxMgOFkWgP0LptZFVTMELbXX6OEG87gbM5MQRhdy1ZD7oIk68NkODbZfl
         ZrtXmzMWqWEb65pZkEdkg6Pq7qs4QPCx0RO49+D1lWkxFRPKklehirHpEt7Ch9am+oHD
         Iwddy5VJK/c0/+VH0fIuXMUcb6JOFEptGoN9oIsF9CpWEFngDfEAt/NAVrU55MVx18Dl
         KpeqCv5GNzeh/GiBe7k2zbfTshfgDACpQojR70R9V7KKx9oNsdrepQpFf5zun9h6wCyD
         IMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774265721; x=1774870521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wS5LtayeZTbWa+/jowDNFAN2aTZHLtBtVNHTSu7Goc=;
        b=WptK7kJqJf09gHGhRSL4JfBvr8fzDpouU1S4ix5YkfvlpZaAYQgDzw4Uw3ZFSEpW3b
         Vg6MFaPHgusc27R51D/QfH0JmnQRac8Zmit/XlyJDDBm7VTT4dl8q8bTQPxzMgxwxPnY
         Gj7vHbMffy2/44LQMVrWgcqRnXHXgWSHRnYSi0prrtUMxkHziGuNYNFNo0lTKeszoZGe
         /sQpc74KUJxHDf+2vMedKsJxysH4Ei/HeskXHPj4b2cBKbWGwnn6KVh2K/GD6fDrv9GM
         QikOSPnPGlPJ7hsaQhjtgS+AvAmYedG0rtet7dyUDnmwJc2B9z2oqYpSAYCJtRjOJm7B
         bmvA==
X-Forwarded-Encrypted: i=1; AJvYcCW6wwsH7cYARO/67I7BU4/SlffKCWhDSRt5G1zHqg4MtBxePdzKoGIopV25mrPTx2xufeEYb9q0FjomkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8yDMlOIZwhH9QRe9jjh0hHWId45HzCU1Fldu15FiJA3QAgA56
	lVbE8zztoiGrJYMcCQE1I60IHRkkHfHrLELNb9+gTVJACyVLM80rR1evhPap6Nc0fTmKy3ZnWcc
	e3mM3UvcNaGSQnDbFOOpJqiJUTFsQ2WSFZmtWJc73qGDuLKfBCm0L0CQqjdFDeOQXUA==
X-Gm-Gg: ATEYQzzAjyLDwWerVXygCFr7NCyFd1HRpOuX/Gtg6B4oL+n6G8RiXbpwuXW1FH82UEc
	GSNXEIpbn8OaaBqGLFnc3YSnIDe6EaXJGDW0OaFQMaMMZfpxEkwFZekeiEcvlXt/pZRkW7XqJBr
	RIQpFVic47aN+QY3Osh5C6Mcze7UJBKJrBjUBe3ineVWt0KyTqFzDZIog2HrBGlvysDHjJQznMM
	jSMagZkSck7SS+oEpBiDZKkRi98ebRfpfc5rNmyzRf+Tuij6VeJ01EWuGFbe0u34YCTXXu4Yqy3
	316v48toT7Jp3C8+/9CR/IbO7cvjS7bpfDHa/xmFaJoON0G92Gi3b6G+0vszf0fNX5mWoswqBTC
	K/ba/or9SRWo1LtuivcLIprDXPBXxpQ/pA0M2hMFr4+qy08RYzR98YneC0UYPxQJrJ3hY1zqQpb
	vCtjI=
X-Received: by 2002:a05:622a:4647:b0:50b:6b21:2a80 with SMTP id d75a77b69052e-50b6b213658mr3775471cf.1.1774265721243;
        Mon, 23 Mar 2026 04:35:21 -0700 (PDT)
X-Received: by 2002:a05:622a:4647:b0:50b:6b21:2a80 with SMTP id d75a77b69052e-50b6b213658mr3775111cf.1.1774265720584;
        Mon, 23 Mar 2026 04:35:20 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6694b45de66sm2208073a12.31.2026.03.23.04.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 04:35:18 -0700 (PDT)
Message-ID: <75c80dae-1ee5-43c3-8d72-bf239fd51fb8@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:35:16 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH QUESTION 1/2] arm64: dts: qcom: sdm845-oneplus: Enable NFC
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260322-oneplus-nfc-v1-0-5f22f544f0e2@ixit.cz>
 <20260322-oneplus-nfc-v1-1-5f22f544f0e2@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260322-oneplus-nfc-v1-1-5f22f544f0e2@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aJv9aL9m c=1 sm=1 tr=0 ts=69c12579 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=o4zcOJKZs6uzFkhwQ20A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: qAwTrqKwXX12V5MLduwW1qTWXcHrS1Cj
X-Proofpoint-ORIG-GUID: qAwTrqKwXX12V5MLduwW1qTWXcHrS1Cj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4OSBTYWx0ZWRfXxm1hAfJmzJHX
 tCp4EQie/MAxomvlH3bNks3RYdBrHy9EpwPm9BIb32MYJkwOldE+QUV6GuNMwz+JtwFXThkWPyT
 YjR/yfBvkFn4kJPj6e6iBRfN8i0TmaEIdsDVAn+OwTSi2gy24+ZQH1i360sdzoCz3LJ6ySOtXXy
 Qkh7w2/8kA2e2x/mEV5zCJL+fXMIJFNbeRIPkre9jbKtfV/X66eH7T63Q4YY0K3uCkNAYi3b6PP
 r29TwFmrEH/VlArTBSVul90JIEt+42bT4qza8Vcq/8esDtjUfEsVZ/f23M3TdMTM5Nd9xVsNqhg
 cKZZA2cBnV8sj685SqWCT9W6fhefzfmyznBSTT6belv8cFJDK70S9KYgHlI4g08SGTlM64mk56J
 jiQ1X7PpALand5hzbFzAw2xOLxmiXzT5tCEx1C915/+wN1mJbSuiTcAApgMihahYkxBUO5vMda9
 gGRqApJ24igCLA/RODA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230089

On 3/22/26 3:24 PM, David Heidelberg via B4 Relay wrote:
> From: biemster <l.j.beemster@gmail.com>
> 
> Definition of the NFC.
> 
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 5b121ea5520f5..34f476299b114 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -392,6 +392,26 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/sdm845/OnePlus/enchilada/a630_zap.mbn";
>  };
>  
> +&i2c3 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	nfc@28 {
> +		compatible = "nxp,nxp-nci-i2c";
> +		reg = <0x28>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <63 IRQ_TYPE_EDGE_RISING>;

interrupts-extended, please

Konrad


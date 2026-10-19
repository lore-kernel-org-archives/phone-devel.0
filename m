Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375FD49AA38
	for <phone-devel@vger.kernel.org>; Mon, 19 Oct 2026 08:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400285; cv=none; b=FNX0fqhl7PYc5UIzPMHUkaAMEUDO82BqODU0vCKvjCs+80Bl8UxngqbGh8NF3PG67bFV9rWSaGliyj51bRQglDDQWkVbPX1LBQjkP99pZL1GPjA4LUN9FoOVCEfvbFa3/0Yp2TToxVsuPIl7yXAKdvf1Y+5TnmWOkPEwo2BDSGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400285; c=relaxed/simple;
	bh=xNHOB+oXgz0Vhv40xdVlUgwVrIcCF/Errpe6IWcEaCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bkzgGyXkqcFc1bEaP4QdOkdRyaYAZfaVpvBVA+j8xIJSLZOktK2LEgAu8fWmbIzTnVAA0Ipandhtski6Ce8XwFhkLJ48pwVGEhvY7UF6mb77GzXh46o2f9ltmDBJYQECgaykxPfvZC0MG1zSmCTT/Vyjg26/SnymU//HBHRLePc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NbIV+kWt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1MPMZHG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NbIV+kWt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1MPMZHG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PIoq2754637
	for <phone-devel@vger.kernel.org>; Mon, 19 Oct 2026 08:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3lCejwFHC+WqRyCmNVh5Gm7oxUroffAXAOfXSOG7sbU=; b=NbIV+kWt99Cye3wT
	ACCzUe7qlz5eAe4kgsa4krFI76lS6ygQMTYNvy9AncI/ETfUJv4355q4Tr31HPsN
	woVQMIDr1PZxfA360eKZ/ltVsjaieNh780pFKrf/VbQ1DSLjn4ZnUoxr9av5JyyN
	Uzv1nnPcyB/ErqRgzjX/0fLtY5Y19iQpgOugQ/bFgllBbzc5ig5sl5awpjIjYFMz
	URW1qYk0WX4UOqfLj+S1BNdIOF7aYPALR3B4OR5XZBl2figvMVw1mXVxJpc+HIVl
	8kj91Cwisp8Ilxn1cbI2qykMUXZJrWfjkCvy8nPPVV3CtfMqrNEN/2qeFG7ha2CX
	T54xqg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48g8e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 19 Oct 2026 08:58:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cac495d99so32311385a.2
        for <phone-devel@vger.kernel.org>; Mon, 19 Oct 2026 01:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792400282; x=1793005082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3lCejwFHC+WqRyCmNVh5Gm7oxUroffAXAOfXSOG7sbU=;
        b=Y1MPMZHGnzSOITmgHhqvlH0EORidEXi3FWWZN50gZQSgz+W0zji6Kvxf1fO8VEY5Jw
         58t+09QQCg18JRDhSDrhyqwDXG0zqPEB43SG3/zSPBCyDhyUKrQeQKlQ+MhukbshD1MX
         9snVYHQWQ4/uVROzmPHnd9rsiZD4SkOu5w3FzHkMd2xXczusfINny0v2/hqFAYyp/AVF
         49pz2xSP5bXUYfWlxXo+8oO/He+xznJlNg3DTbyTo4QdjJ/JY3UFwKpZojgajXqoxRGQ
         ccppp9zIZRMe+fVq+CaRiKobPENKDQl54/ZCYxkHkvIH6z4b4KzfD2Djr5SXkLd2moxD
         GTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400282; x=1793005082;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3lCejwFHC+WqRyCmNVh5Gm7oxUroffAXAOfXSOG7sbU=;
        b=I8OhZSGWsEWfCBuOP++groE+vK8h64NESju+XRthtwjz7CMi21CduRIIQCtc2Vv96w
         DAb8RL1SDegn140fva0dSbqccExfDlSG74dBAJBnKE5mQPbljYqEmD1xsUPCjiFm5oWg
         wJ3FdMCu7GUDhjUnO+M5FFhsMmHvFegeGpyMTCTV+QMy+UssbBLE/FpNEY9J8x+FOgxQ
         JzwcqxwBj6xSaWQJUEoeJNgH1KB16dbzX7CUMvE+4QBFUETQcEYihtgPMK5DqgsRMcBy
         /Qh8scs+jXfT3g80R/CPAF/krJUtwKbj9MkqssiElwGvccgUe3EQ5FQ/TlzDkbuP7IRM
         8cag==
X-Forwarded-Encrypted: i=1; AKwUvBy2XMxiVoO2LWMZhBJt2IoD4yMT+pYN+XhmMCIMkt+8dI3qt0TqZDpkGYOd4GVZMywGYDHBFOQmvGk+rw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKBNF+wdcncKzRYPUPGdCd3OVHEm38wHKu3xEE/cJT/3BCrguvK
	0la8ivbg2qXCuG5CngQLe/gYvQv/fFNEF9CF+e4RJ6NTGcQMFGJmA3mC2C2alBvm5rU/L0xigF4
	yJREbxkyiNsyO9I/If9U+jaJs99tlMZPaaqc4xbKbxJp2mUP6RQ/HxvXB3MV9JHdCPQ==
X-Gm-Gg: AYBFou32cO5eGuknuqBSh5TIhlKrA2ZUQyqTr+kWjsqYuxRwxzPbIyPEZp/OmVmDUeN
	NFg8LQaEumaClNVKCDfKu4/WHy6yxTnldDUL1veip7F9LOCa1trfXNGblCk+SHIQ6Ti5dYlIXgk
	QFjcktBW2VQm+9oFaISpMWaXOMS1doCpRbl219d5lacVXbZplePWQmaJYgo4Kfc6hTghNI7kf3X
	/8LgOz2wHEuK6Ayi36PzcIG21/15Y1B97975BLZ+hcHqp/x+GeF3WE7ssSyxx/OJEv8BJFWxJK0
	dTHMzaXgKvgB0SGzWND8+SuqhxIDdVYbENut1OM/VsW6odaARbJ/mltvCwIzyGrMdz1W4+rnz9h
	J+NyYujxKdiIJC/zCck2b8Q==
X-Received: by 2002:a05:620a:6410:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f29c4bde6mr1312852985a.2.1792400282479;
        Mon, 19 Oct 2026 01:58:02 -0700 (PDT)
X-Received: by 2002:a05:620a:6410:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f29c4bde6mr1312849785a.2.1792400281878;
        Mon, 19 Oct 2026 01:58:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32897fsm341461866b.2.2026.10.19.01.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 01:58:00 -0700 (PDT)
Message-ID: <b054c732-0517-4b6f-b501-8e9a773d326a@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 10:57:58 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm6350: Add memory-region for audio PD
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261019-sm6350-fastrpc-memory-v1-1-1d4edb11238d@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-sm6350-fastrpc-memory-v1-1-1d4edb11238d@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNSBTYWx0ZWRfXwEf8ooNGamvm
 Lj56ImQXaz5Q3MC3aAB5TNSZkZN3gHoKJCyFHloSBzeJVybPcbp84p7zCTPski2IlyETc+Tg25u
 2o/yFS7JiDMri/BFMowjkMgleLbxeWDcbT2u/YQiNIHITnJPBLfu0/b9kSr6zi+bcHAabQ9fBwS
 AvHvyAIaKSi24OUi7q2te3WLk+rBPSEAbBV6Rlt6bhDboc477QBeA2o7KRHnB/UTL/G/kgSOx42
 uzcyZ6HrSN7FiLazm7Pf1He6QyOMHZg8Tfrq2vqf7ME4U2FwdCGY/xagGtbLrCsDCuwIWEeC1c4
 hrFalBomThddLAr84qtJp1SFiwTFsXykAjpn+qTMUw1dyoQJ2vRB2PZQIK+IAZA7N4/COgzs3IG
 VhOvLOywtK8xPtIcS5cH7yotcBf7cnDtMyl4wq6N7cJNS2hHfCdJ63XAz3eHU4kTNqIqYXMxZQN
 cGlznETRyPVelPvaPyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNSBTYWx0ZWRfX56OyNwmmBP+T
 FT2RieOp+unssLSF7IDcbBRhrTxFTOR09MipdV2J7yk6CqFk1phbazissJI67HzWbL2CzaRGTkY
 a13yv0MDw+wC94ropAiZNPTEU4NXXcg=
X-Proofpoint-ORIG-GUID: gEVCG71xcSkSYk798yzQZzRTmwmKmipb
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad5db9b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=YejXzU1nXzSU73WboeIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: gEVCG71xcSkSYk798yzQZzRTmwmKmipb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190035

On 10/19/26 8:29 AM, Luca Weiss wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Fixes: efc33c969f23 ("arm64: dts: qcom: sm6350: Add ADSP nodes")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

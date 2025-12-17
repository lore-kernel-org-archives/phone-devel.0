Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29436347FD0
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 13:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976488; cv=none; b=utAx7GA0WYHjsRJWe9X/yeHpis2OrG5FoKl3KDovqrtcswW3Vt597hPsvhJVzAuf02lNks6RUzpbs7p5SJvzaK8toB7qHLJnKHT3AZT75nsq5lA4cswZsAoiXJSR0lfG1CRpCT4Woc8yymqlvm7/RAQRhmljmECRJIwvL9gZ64s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976488; c=relaxed/simple;
	bh=A1C1DVw2kYKq12/0q2dzzBwvYL0KxPDN6q1KBWi9EjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s1Xbs7qPP2unLv5xoohimbposCZopQt7UsXV+IqRUc4pzS52fprZZedjFVIVGhuT53KpoGUqGq+FBA7GGmsRE5Xl+pnhyVuMxg1CGbbNUr33iAnrNE4Cmw60McrhZoya149wmVkd9D2cyBZpgez0dNjV8YnBDjWGGiB7sYG9oUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+Qp6wO0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T7dvgoAS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+Qp6wO0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T7dvgoAS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKq7Z2390544
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 13:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uLspVCdAk3EWHEmP/9FH9J41h2/QBcWk/TBEt+Di6/w=; b=g+Qp6wO0RzGOqaUg
	hAeFK1pwCExQq6JSF+9lJJqwnWhaATJIWJOQcrXtGzf19c/xenrWfjS5GMoFmNXR
	MzWCGMzr+jNWpGDPCSiZspoopyuRCWHm8qk9EAibULqLYkRKfnDkBPnvVz5PcCUA
	AGWbeR0EUnEuIBTnUP9YEJlEgvm8kA2bEHTuDKQFY000GoImLn1J/bIJAABXaEwg
	+Rtdue1qz9b44cSEgFekfbHltJzvaxLoBC0hYunaLnejh37DyiMbwaAsNAmYHED3
	V43kbGhQX82mSogSk83wy2ffTvqSliv0yC3DkPTJr6d1+OVDDjvDrm+1pBiBXhja
	hHFE8g==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3b7g39rt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 13:01:25 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-65b37ecab0bso67663eaf.0
        for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 05:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765976485; x=1766581285; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uLspVCdAk3EWHEmP/9FH9J41h2/QBcWk/TBEt+Di6/w=;
        b=T7dvgoASnTyQF6U1GXKuknUYG3PUp24E5VBUMQpGHd/vDVQQ9OJHTigK37AmKTb6E9
         7kNsA9W3eoh9P8LDkvE6fofP/QAeqMocJPoIfPKcAFc3vPprZ22w9ApYXGV8pHtD1Msd
         gsQcDrfN689mAkanGmBpShDv/Q+CkjTjruCd/luR+iSfEw6MwgxovHWOcqzyZInwP1w7
         OcYV/teKGptb87s6joecydgLwGeNDL1hnKtQlJiVq9wYgewA1rv+OW3tBHbZ0vkO6ZyR
         s26YdfgBJeuZFXXwHhC6MT98tUkjXI8yrKDzDo95fXf5WXdDCMIUqZ4LiCU1ZW3BFtkN
         cQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765976485; x=1766581285;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLspVCdAk3EWHEmP/9FH9J41h2/QBcWk/TBEt+Di6/w=;
        b=h4X0dDrcmUa6Zqtd0CFnOCEGky/D7cx7ziEYsQeAGgokBd0BKVhhHVSDhEaCUobUUm
         mbPyl+Mi7NhDVdDXe/wIptnTHa4dPO7GRWrhSNnEO9CkO65hq72dm/wduaG+2VtN8sdv
         DUPymvlmYxcPsLVkXDN1pmnKOGiWoowkXAqGHaD+46LywyE4HoU5eRwG7jrF7ZYIAdXd
         HYrweUp58qm8zuehcfho2aWP4ZMpPjtir/c+RIkXGNPv5rMX+kiuXkCW1JIANGMDIU4s
         332lXC3i0c/Rc90mEJYmwgBW35nzwfodUsT39K2L6O4soevZ/s79eySSVtD1+MOa0s8r
         EecA==
X-Forwarded-Encrypted: i=1; AJvYcCWVN8MxJBoxKcCCMDXmFCRU3KhAPHgRCiluMeHq1wEbSKTkLL1lR7ve0eNlgD8/G/1jqfSXFFSa35Pn5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgc7mkIrtH9PSk4OM/8bze3Z/BbPsfSkMa03Z97YTQGtbh79eb
	K7eLi+sTr/9cx0H4k4C0KrYr5+/d6wo7zOrGNB/EIrlGt8HDuAZYMsp6VK+ptwRv35/w7IlQcN8
	WCZoNwFhE4xzwJx44tJWf2StpWzJULqtnE8oEFiFc61udvHqy0WsrMQHcoRWD5PbeHw==
X-Gm-Gg: AY/fxX5QzVoB98iLW6qIq6KwCPpvTmnQ9i9cBVTW5hEHHqDcRpoREa4MOhAw2zswNKp
	jZ4epw7uYistiXWP2Kj9Ov4hvMtjwgdiHkMOr2740/+xzFoDQClXIkahXXK8dP1FOGaCHHxDt8+
	nDdMKfPzOcXEdAyKTKeStUYhwcIFRypZmdifIXu42B0JgCZmaYzCg/qjwuIp7PeopqxYEwUOALP
	eWgi0/TQl0Vvc7WeZMz91g13Q3b2N4XEKWY5KuhT1TR5TXzGgBVq9qxhXDu9Eqsq5xxNKKvoZ0W
	mpuI4nLTtN0qL+ofsmhwHRCMQtvpKYvhs/NLUT4d2yCLdCpgOSrLOvdHZkA0Xdsde8vuGSCp9wa
	8FlmSlWD7BDoP4uFvvoIfqKhzru0dtBgJhfACeaD1gv8yZ9XYLC1RUIIt5g0P5ZPDyA==
X-Received: by 2002:a4a:be83:0:b0:65c:f660:57c0 with SMTP id 006d021491bc7-65cf6605d27mr246375eaf.1.1765976484821;
        Wed, 17 Dec 2025 05:01:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfXurB2tcNJ3nbjzskhO5vlvJezsbyatg1yvX7UfLKzmMg1RdCpvpJB188Epc3uzojFyltZw==
X-Received: by 2002:a4a:be83:0:b0:65c:f660:57c0 with SMTP id 006d021491bc7-65cf6605d27mr246337eaf.1.1765976484138;
        Wed, 17 Dec 2025 05:01:24 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f56b6a0sm2386349a12.29.2025.12.17.05.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 05:01:22 -0800 (PST)
Message-ID: <1bdf4195-f344-42c0-9ee0-042291fa6f26@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:01:19 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: kaanapali: Add base QRD board
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
 <20251215-knp-dts-v4-5-1541bebeb89f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251215-knp-dts-v4-5-1541bebeb89f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OenSiBt7-wH049FUMdw8EXcm-AZnMbld
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwMSBTYWx0ZWRfXwM5oUAlklFLh
 t2XJMuaEG1y6BBQvrgBFL3FFsC3y6BtrPFk3LxUee2KEs8f/XqnUW3ClOCr2o+dNqbWL9mJOdKu
 8OkqZUN9vXpy8Trt0QR44qImEzt8QG4bQ0NSOKcp94F354mDZ4XTsgiVroMOsXEVs0U3wStutnz
 Q5nqV6F320EpGnEfZq4bPl1iq37e4zk4SV+2VpjDcocthryRSzXweAJLydgVA5LzZhd6Nsu8tIY
 FP4R0VbkXwfzyE08vU8P3zlGjNuEj2IVX2Yp6Y8bKr7kl9fqMqAwNEdxMM2OHbC/U3NI6a1XW3l
 kteK15ov+AYNvE4MVbXEtY0jdidwK7oaNBwKzCGxRLKMvZQx1VW67oVQrRKk5VLNo1UGcT2Wv9A
 8oG34NCTn2pgiNmrnkn4aQVmgGpm2A==
X-Proofpoint-GUID: OenSiBt7-wH049FUMdw8EXcm-AZnMbld
X-Authority-Analysis: v=2.4 cv=PbLyRyhd c=1 sm=1 tr=0 ts=6942a9a5 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ii0bGMNOlrnFhgTP-T8A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170101

On 12/15/25 10:07 AM, Jingyi Wang wrote:
> Add initial support for Qualcomm Kaanapali QRD board which enables
> SD Card, UFS and booting to shell with UART console.
> 
> Written with help from Jishnu Prakash (added RPMhPD nodes), Nitin Rawat
> (added ufs) and Manish Pandey (added SD Card).
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7B2276058
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 13:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768571908; cv=none; b=qNbwrEMjt/xXHtBwXqXX8E9mq1Hn8TLtU45N6OurQbQ+1O/johT4BScl8koOwJEfUitYGdORzs9xG5lrhfw/C3hIPR0R80AqLYudacciSA01dfH8UkyiDgjOQatCH7yJQVoQ5g08Pzrt5AY3U3FUirc7V+M3RNzAgFfx635fUlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768571908; c=relaxed/simple;
	bh=kfQSZHrSVdF5x1/EhlvZZ8On2MIbxaieC0nBq36IeUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DhZ3BdMLIQbfkyKdVbYH4Yugy6C6oTply0gBH0ZHhZbDJVsSRPCnLRwIH8Q0tJGn5zmk8vnKtaFNmWZHZsoSWCtdv+ovnr32xtvKcFHc2eopHKjbL/z6h0i3VFPV3SzYX1BrK04hD6CpYXQat60nFQB6duCt0tYyT9UmPt4S+0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgfXFS5S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DVftt1GI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgfXFS5S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DVftt1GI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G7ubWf3582947
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 13:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IajFANFp4pMuuPZKB8iLv8HMo1BZW4PXkR6TrNFXv14=; b=DgfXFS5SmidKS0C2
	Ynf2tWaTErOuTlC92hSvrMjVt/x+ikHkQ9dbHp//Pzf0d/kGE/yRE+a/0FJvZHNt
	+MBQt67r9af/ddpx+G4ERzuYLzSYb9wwUp4qoQff7QbxntPlckqIAkkXqczcmQ5e
	mTXo2qcoQeaVFF+nuWxbPfhtl/xZ+Oh9NDiqYQvGmVFC0SSj0sN9oJyoOqFY9+mW
	1aBwwRzhjLu2vzvOD5WuIkHfuD2OHN7Jaua7MweNiawwFJx/TrX80riNxrV1exH2
	qkYKUWH7h/KOivDYFoT7FQiB+/s1lHG88XcrT9D/TEFWsQ8EpiNioVyMDTdX/mGH
	3gUUUQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9aytbfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 13:58:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e518fb75so33825885a.3
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 05:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768571902; x=1769176702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IajFANFp4pMuuPZKB8iLv8HMo1BZW4PXkR6TrNFXv14=;
        b=DVftt1GIPpE75/qMzLk5Srcq3ezodJWUUnO6BHOntZ7OhUvi7yByhwqUb+RrzowEXR
         pB5or6D4YScZ1O4VcOXGdEZv7Ja7sIphNuGEHqJlaHYSpf96LX0T1gZoedpiOtbyp57m
         RnZh9ox9FNPJUm6lSudNY9FvdCRVUq6Jd7VTZckaeFHaKadjHpu4Robs0Bskd9in8L/g
         44ferOXpJUS6i2WainBp+bmILi5+EzdrANlc5bHBL2OMGDOqvdizm6xm1NghMNG5e/zW
         1BDdCKwb2QArHZr1F7Tj2a0+3CAtQkztr0dyPpTAqEfHvzTosD71JXGYYA371A3/Jg0A
         WSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768571902; x=1769176702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IajFANFp4pMuuPZKB8iLv8HMo1BZW4PXkR6TrNFXv14=;
        b=KYBB/qckftRoWgSYh/h6zMMtEWSq1yeBn+sxuwKCgU+xcunabNQyt2FJANeU8L41oo
         JPEYrDx6t+ojiYfPX8EST0E1yajel1n3EI6syMvmPuLaWpU9ZgaccsZXxscT7PO28Jup
         V0t3W4Ye/ntD9BERz7h0cN/jls+kWrq5UWv5TxgdlZV2sJXo0LgwXWZQeRFr0RsPxj+l
         sbWiAF1v47sPp1T4GHUQaicuBf3o4lsKgCocjKcrBZyjpHuv54/iJDv+T60SBICkHHX1
         k23VTRKC4IGTnReAz0WfhZ1CU3h6EOvpX9EHChCJshYS/NdKYUTR6DJKHnUSahcTHgQB
         JiFA==
X-Forwarded-Encrypted: i=1; AJvYcCVBDsHXpctofEjwsQYBb18Fa+3kVZRq5rhu3fRisGIO5BB+o/RtWzX3TXa+hskUbSJFIN8obrIbXa8Y5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzEMnerCM2N/lg0gI0vfG1PcQd/TNLDq/hBgBvUDVkhwe/wve1
	BrbL1YP8gH+y3ailHpK03flCjttdHaKTERqptSGzhn94G9NhiY1tc0LzQVMPSMHSX9oeckpEBEZ
	O6Chnp8j72qv92I04/F39SlmgRJC6Xmjbzgl1YJlcGDimU3/zi4jhM5BnNr2nuNxbNA==
X-Gm-Gg: AY/fxX44FJf15H86czzGdfhC2yAaXRRNKVj9Z8fAN4/TyANpezxWm53406A7LxiuiZF
	H4//N41iosFOzlebVaMXWryXxWjDpjPWYOvkG3Ozk8eDFUho6OsttyC1zUOlXy/GNOTJpyI6qd8
	TzrLly77FQdwsooN10OjfaU80ljmDe3epBCmBXV1eo/mwGoVDnTF8X60RcTkmUgnAdBtr1ubSOt
	wKm14jfTGkj3+YnriMcxGVQI506TiOsl6KMHEFBmBgiKgUVPYEqK15at5K5K4hs8Q3+VrBt1oVh
	by4eSxmYzRTLfC2+87AGR/PET+mxNp4JSPPVXxQv6LRNw3GRRtOKD1nzSAfEC9snC0gt2cmoyhm
	Cnu23y5OZtYOFdxRqCh0u+2YZhX3OgB8wRV+NRM9VknJNfbZMNdv6aj/zLLMFav+TjH8=
X-Received: by 2002:a05:620a:44c1:b0:8c5:2b02:83ee with SMTP id af79cd13be357-8c6a678095bmr319993685a.6.1768571902375;
        Fri, 16 Jan 2026 05:58:22 -0800 (PST)
X-Received: by 2002:a05:620a:44c1:b0:8c5:2b02:83ee with SMTP id af79cd13be357-8c6a678095bmr319991885a.6.1768571901943;
        Fri, 16 Jan 2026 05:58:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39c38asm772659e87.84.2026.01.16.05.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 05:58:21 -0800 (PST)
Message-ID: <b558d5b3-78f7-41ae-8cfa-f54fcfbaaddf@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 14:58:18 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: eeprom: at24: Add compatible for Puya
 P24C128F
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-1-28e01128da9c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-cci-v1-1-28e01128da9c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: avT4sXLrfxf2gTY2gUm8EpAJot1WdsdG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA5OCBTYWx0ZWRfX0Rz5uWpHr/Ht
 o2mpatTFmQEmzcpyoY5WhsCuaUXTCua9VNwWV0MqoqWJzPP7Bi1j2wETeWv5fo6M2WYaAMcQLal
 cw5f6rTaB0hCkqbIqguTBZL+KuL+MHFBB2v+ZAi0sDIP81w9VUUCoVG4iVmCV3+hA+zOsWOAXY8
 ul+b8Bfj7woyKWPYHvTzm9IHEQ/Klffb3IYqYJ3HkL2nD4ZWgf/hGVUa7JvAVo4UqZTp6dTAW3b
 +8/KbU8hEYmNWioiMufhhs2XskSM17DkrkjrgRuleK5UWmdT3iUF8EwNUR9ODr4n/SUnkSk1AxP
 WJ77k73P7QkK06zOLCbmrrFVfTdlh6a2c5gsSkSdbNahZp4JUJ8wo2WboGDzK2416sVH8wvnlrf
 abMJp9QD1dF9KteHiMUi0fgGBsHN/WF41apwZ304MHwI4RLZtqQBKylnFu57A1JHkbjq9drFUhu
 lWfS0/nRiLAQnnwBEfg==
X-Proofpoint-GUID: avT4sXLrfxf2gTY2gUm8EpAJot1WdsdG
X-Authority-Analysis: v=2.4 cv=NfDrFmD4 c=1 sm=1 tr=0 ts=696a43fe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_05,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160098

On 1/16/26 2:38 PM, Luca Weiss wrote:
> Add the compatible for an 128Kb EEPROM from Puya.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


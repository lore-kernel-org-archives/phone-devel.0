Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B502BD5A2
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976467; cv=none; b=Aee2idkbY/zOsRq5uH56HPeg4xIODDQWw8uKl1rhTwpDKP3oT6qGY46x6W5uXatIXuvsX/jFjZ/ERnwNoWG/dtRwMLD1Vfi3zDsPzkvZi08m5hU2XMFY6CsJsgpMJLAMIvs+IcmtZJzu8LuezTF2Tz6W7NnTuqbxaMtGvEuYpRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976467; c=relaxed/simple;
	bh=HVgZAWbpr1kTkiTZYFcNNunlRt/FqtlF7sf5AeKZyKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BJBnKP6AFGTGamQHOCEDJiIUv5CAqClD+DDQU1Kzr5KVZggXf0y/i8IDd3sr5YYVezi+PUEdhDW70yhYPK98DxiX8d67RYbWPgWaNiMay6xIMcUa18CroQAZjU/3SLMGeodDeZC94KwPnGhnq8oxqdNZTilIpgNbyXN0PiVAZ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVtu5EWV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frrXNidw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVtu5EWV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frrXNidw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKpKn3048736
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 13:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PHzlg4EzmcOyOoQd+RcJlLn2pewRmU7gpHgVURI/Mgs=; b=RVtu5EWVK+IZcdBh
	Abuza281fFQSDLSnOYNXZwunUGsmyCTR9NltGkIPknPUFEbmsBPFNAqn3usNrrv3
	cuYiMRnFXPcnRIkW7rNvQOcBMMLwvCTvuvT2hVt/gmsKoSlxIj098v3+dzwH9Jzv
	AmLLjxtzWSZ0ulxANWxTGCfrFxFAeXHWanvd/CC62yF9kx9c5NLEeY1xm1ehRmU4
	6ffBIy5sAyMgizXJXyPpWpPMm0+1zmSEcvgMDwfjCPHFnrRnSkMelDCZ4dmGxoGW
	/8S9jVoKJdSa8ypwWj+2rwxcixGN+jFwIh9uT+ei8avuzo84KzbZ2BxtGz10t2RY
	S6NVjw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3jgqa0bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 13:01:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed9122dce9so2858971cf.2
        for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 05:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765976464; x=1766581264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PHzlg4EzmcOyOoQd+RcJlLn2pewRmU7gpHgVURI/Mgs=;
        b=frrXNidwLjW7qqzgWCM3RrhJsGYFzEgg3RbUUQaN2DW87/FtO8VqCJgAfKCILLj4QD
         fkcBUnvRAo1Lbx9nUvmPzxqW7OW471++tEmuM0mbLV0SvhsMwogoO9WsLxUvRZFgV6QM
         53hDRB695sCXDzxGi46B5QNuxyibCU2dtV86lExl28x2+91ttj/nO6v5EuU7VQQ55ucb
         3shzS7tnPB3+/pNXpa8UgHQYuAPaFj1yIRdH6/TYnOmdUyxpcEvRbQroELGiTkZbZeIM
         dLbZ+b/wp35IVRCdZETfQnDTC0ocIdUPB7yRs2oHr3r2JDwsDPa+QgFWPT4oMuP3TRdk
         JtkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765976464; x=1766581264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHzlg4EzmcOyOoQd+RcJlLn2pewRmU7gpHgVURI/Mgs=;
        b=irdWA7j2HSaOsjlnKSAacYDmDy3nJV/rlVQb07MOEgQ9vKSs4xqNCOxkrHykK94PVt
         p8O2JcyBLnsGEiAnEuujT4vEof6gkq9y4ZUwtLUHCo+gS2i1a7rRonSTTf7J46B0r7zt
         X015R+pRYlkuvfrk4K640a4u85ryoSEzNsUw07W12bqAaffHHONLLfH73dRCs8FPiA7P
         AH1yJV1IEmiVBDGN7L7KO/UOiXQz/Iw7c++tzMbFseqVyxBGT3WHoGfyTlTDEjyExnCc
         bzoSO44Gg/j9VBdz/aodD4qd5+FRzXZ7LknDE3x49C1oD4uF57xYhdjwxY8s6pRQNFsx
         ozRw==
X-Forwarded-Encrypted: i=1; AJvYcCUDlTOIrDT5Rdh0fS5c60buwhKkQUgDdJJYtKPvNUyNOv/Ag30iG4kxFCyOW/FLH9FG4s0/3DyuPIOwcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2zkHMpEvekHoAZJQFXTcEmoBIQy/isMSpjeQnsHfN71YFIx0g
	WHzN8n7QGcVv8uN1iAipWJzRgCMvKOrXieXr4eAcMzdXdIw7458f0k1+BcVjVupjfjCZIV9AiXa
	5lTDYpahZ+G30Lda6iJn/5fM7TVGed+Qd7sJqtNu9PVRBhJVrqHuDmeLQcwF9FTPk8g==
X-Gm-Gg: AY/fxX6mgIhRN5ElIuV+lOLECCjC0Saa8sLczyNZF9suBwvlYZHC93fdezs5aUHe7t4
	sIcp8PrT8aEL2IPwH1F5JksWuca9fP/hLDOBnOeZpX9XZSoFohERBDol+agC1sKbqp1PteWiOwm
	JTQv4znqBnc3s7KCbpmezHpZJ7VhzHACnAsnGqQoyAaAxIA1lYuDKfxB5eQePAnkGe/0aubEq53
	916olSbgd8QkRgEiYqnh/Wozhs/HlLXIqL56tu8dU0V2CP7BBT3vTVi2uYWKIZznz9zX8NbxRmw
	wxXdb28raM/90ihjdBdwmKQiUp3zOytTXlT5HMs2jjehjzj/QJ1Uk7kvg+B6SKB0HfVof3aZZY0
	xR2SdzWOQsIWLF9N9pAH0ePBYZWEvsvqqZLvkFDHu+c3N/iNTDS84WoFOWlq++iKvpA==
X-Received: by 2002:ac8:7d14:0:b0:4f1:be96:568a with SMTP id d75a77b69052e-4f1d01680b8mr184598181cf.0.1765976463396;
        Wed, 17 Dec 2025 05:01:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTy37xBIPLDeC4Jh6SE+/qv5pBcSn+YMZ+pzSoKGAlcjT6pNaPLlls/0sjvGivcG1kNzuwhg==
X-Received: by 2002:ac8:7d14:0:b0:4f1:be96:568a with SMTP id d75a77b69052e-4f1d01680b8mr184597231cf.0.1765976462463;
        Wed, 17 Dec 2025 05:01:02 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa56be0bsm1892480266b.52.2025.12.17.05.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 05:01:01 -0800 (PST)
Message-ID: <c1f9c746-0ebb-4b65-a992-9f60ea5689d6@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:00:59 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: kaanapali: Add base MTP board
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
 <20251215-knp-dts-v4-4-1541bebeb89f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251215-knp-dts-v4-4-1541bebeb89f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VLjQXtPX c=1 sm=1 tr=0 ts=6942a990 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rVI_ATdNTQjFCBPYYL8A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwMSBTYWx0ZWRfX6XWhNL0587DU
 g2XmhX45lZ6WXpXVnW9bsJ3DUSHmtZQHM+LKpzdUfEWIvyh2sqEAmLV8uk6cStFuRLc/zkrCLrX
 ayqXKxxNwWlq0eNNjkdVX47gfG0My59haWmykN/d5AL6l9LbWbMaVA5JvF8e8K1URqVW+FBw1Uh
 gHiNhW56d5rjdmyLEjScVYtlYkOilyCweKfSIffsGw80gKN++dJ1UdFEFbWuZLnk45tJMo+I9lR
 MryK2/d9VOJMtrtv4PRF5K9TY59rrbi7DxQMMRV4dfjzj5hOJ3OrYTvBvkp1tyzxR5n4RtQxjkl
 iobQkAEX/m7rOeIvGv/93v9QwHYJfKzEUtdzFcvvowN5I0XbeoX2kGGRy2d86FgNfpw4OESwmAL
 KkDZblT2ba3oTUb1LidaQg7iOz74Vw==
X-Proofpoint-ORIG-GUID: EznWLkmOOH6xapJcNlr0AQ6VXPAU81s2
X-Proofpoint-GUID: EznWLkmOOH6xapJcNlr0AQ6VXPAU81s2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170101

On 12/15/25 10:07 AM, Jingyi Wang wrote:
> Add initial support for Qualcomm Kaanapali MTP board which enables PCIe,
> SD Card, UFS and booting to shell with UART console.
> 
> Written with help from Jishnu Prakash (added RPMhPD nodes), Nitin Rawat
> (added UFS), Manish Pandey (added SD Card) and Qiang Yu (added PCIe).
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

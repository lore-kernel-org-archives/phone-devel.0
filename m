Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9920E30DD35
	for <phone-devel@vger.kernel.org>; Mon,  1 Dec 2025 12:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593069; cv=none; b=QZNGoZBxWTMb+z3E4rYAtlPYPkw9Dvo3JfRNiS3gbqxWwKWVJXB2z7LKD2dyqn9B4TxwhQT9ESTngsgv8xcAzsLwi3NwqRl+sGdwwyQqrH8wtiz5ssxkJ/ytrYY0S2mnMrrdiL3eCESkF5M2nJo22cVCFnZF2glh9DmPDCBJS6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593069; c=relaxed/simple;
	bh=SZG2zVsvnrYTIab9Ox8UjREUTjP/LWJEOtixyXpFPHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qp3r/K0oZfqGOvGIWzQ3dPvysytS5QS5LTJE6cptvYp9sg0uxg7PWE/sBOFMEor8aKhkXtEomaUscTV8rQ0tc93w4740HaZM0c30xSp5nxFCfFwKJEXxLCZDwB9H5epuYB2eO7phYJmErWTxzKMm539iIwRr1EV+7cIzYagZ7yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fWhl3d/Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITn+jW7y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fWhl3d/Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITn+jW7y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1CG7MJ060525
	for <phone-devel@vger.kernel.org>; Mon, 1 Dec 2025 12:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XKwl+GOCTsBCMwxW90ATtiuHWqMxxr38vA68tMjCJbQ=; b=fWhl3d/Qaw9G9q/W
	o4U7TloQO3A22XJxQn18A+kMAulHOPpdqSkzhSGtPcAvi4An1C1/z034ScQHp6Hx
	eLJb6NJ/WoWyRMJJp4AGIU/2HCkaKaWfG1HDB9njq8RVUIz7P3BGmdh8tSfQJiBU
	72tV4xo1JSpCSqoeBrkoADBTIGh1OJQnasowyPZyVAQGxtSoBaLpyxvST0kquRYJ
	wBSXr9d+BRxc0PGcOlac+gehG6gfndKbqGtq7eBrCHk+yqdjRpYdFEqRncMzMnaT
	g7JMU7X0/V0MQ39y2jIrqHcfgrE3yMp4b5f++vWPa7VbP9HwG0vNDuTOYyxCuPEX
	15yhsQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asavh82n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 01 Dec 2025 12:44:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edaa289e0dso18739891cf.3
        for <phone-devel@vger.kernel.org>; Mon, 01 Dec 2025 04:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764593066; x=1765197866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XKwl+GOCTsBCMwxW90ATtiuHWqMxxr38vA68tMjCJbQ=;
        b=ITn+jW7yqjPDe1VS50GaMuMg2rCkCd5lihBEJzbWgfhQf7sKAQG/MIILNT4he0YpHr
         8MM8FQhMyt8ZF+y358ak0d+WJjjub+6Tujkxx/YQU0LJ4DeRSJfNxEEzo2mRg2YHDSAh
         S7oK3qP3lkEW5Mv3Abcxjlt5F+ObCXAX5DtqMc8U9ATHPXZbRJJLY+lwYk2Z5X4X7P8G
         +j9M3+AyIj4YAX94Eb/dxYsoaOI3b5AX1klc3GVcevA9jMC8IMrXt0wxQ15/US79cXbo
         vYfLsnATY4WvnyvYkRyv9YIfhhZ55ug1oA81/6tcxmArKxQtVMzajcbqio/7xJeH5eM2
         z98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593066; x=1765197866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XKwl+GOCTsBCMwxW90ATtiuHWqMxxr38vA68tMjCJbQ=;
        b=NOC3ukTKUkG41/Y97Qj+LALOGIAeaRDArIRGAqhDcpsZAsKSQJQp2ABZNHp8Oq+5Pr
         CftglmLMRvq43aY9qIYKoOr5PsDFBu1WaDSyyZms2CkuiRMWe74HkEmGzORJv55FTAV5
         AWX4Pc6aXlKJsr3+icDaHr0XvA3IuxJmsikCwtNTwiNTMMvzB+9ojYw/x9zPlutqP/Pu
         qxCijmNi+G1W0wbz0aJsUesoEnXvC+nLpp2nnNP+xPMYTkKxzd2vrz2Gde0/+Cp5ZIG6
         pDzSQTr+abJnnIy9IT0Yss1eYytRFfmgQ9OLSzmVt965WK1jC4F/t+JwMgz3Ifn8A0T/
         UHPg==
X-Forwarded-Encrypted: i=1; AJvYcCVmcdw959gDAZq/y6LubX95nHfG3LGL+8coQAws7zmHgOurS8C+gacWw/xAWNVAUt+n22R0iexqb2OkZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu6I6yR1M4BgS+YkN7yoJ0pcdFcpjOs5uk1nVbXWwhvRluPbxC
	oeol7U08wE8lMdtcft1GINeSA1bTlYsiMmrztdRkivZf3844LuTcNB470f98tiKJ0Xi97s6E0Sg
	cz93u3WzY0fjKZmPzMVlRZ6wmyWWNuLyvKwE+exexTpyMjxHzRnuHqeyQYyel/v9Jpw==
X-Gm-Gg: ASbGnct/8XOLmE378rnLgjmu1rKfmzMCnKpTzCELvE8OOdix9lrjcGXNBXMRnL7U1Sd
	dMeEhFkDNnCeLDD9YF4Of9sJXZY1BMBCh6k0S82Um8mBI30Po+UOtqkKFkRDC6ATLezcGk8cywG
	zXLfbju7i7IRfehK0KGKQTN2N631CqX24K3QPJPR0bb7V3daPVyI5wi7xio+/YGckF9Kx42kHKw
	BxSYe/BSWT2DObv4MKr0UBHO3QGxLLnTNsuskDxhD3hqq48YoCwJlikBxcx7IzqSYnynE4ENZPi
	gNYl3Ec8RYmy4DeDj8goPDYqHkGaPQPW1HpDhkZto4YeJDD0hKnJ/qf3JR5DwaaGkuzhxVHhF4m
	8yYQtUMwhxOiqGYHpRiz2axa3vl610rO6FsEzkIN2VNI7HLPqFMpGUTWTAuopIxRUvas=
X-Received: by 2002:ac8:7fc2:0:b0:4eb:9cb1:c290 with SMTP id d75a77b69052e-4ee5885a9e5mr409428661cf.4.1764593065934;
        Mon, 01 Dec 2025 04:44:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFO5N2ElNmxjxswVbeCVx0pUpRtb4OFDCDIY0V0LC7bfnaDvDOVEwJwyqMrzTjP/zbSG/qglQ==
X-Received: by 2002:ac8:7fc2:0:b0:4eb:9cb1:c290 with SMTP id d75a77b69052e-4ee5885a9e5mr409428231cf.4.1764593065475;
        Mon, 01 Dec 2025 04:44:25 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647510508e1sm12431764a12.27.2025.12.01.04.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 04:44:24 -0800 (PST)
Message-ID: <a5f4960a-64ac-4c15-9146-7613987d4114@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 13:44:22 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/12] arm64: dts: qcom: sdm845-lg-judyln: Add display
 panel
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-5-a5a60500b267@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-judyln-dts-v4-5-a5a60500b267@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Bb4GOcFEmRa-0jonIVQE8hOdmNz4llM0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMyBTYWx0ZWRfX1nkOdOz8ZcEX
 xQlVtdzMnmGSkNj8c9db947OHQPst3I9WhoekiyD42o9vrnoetXzD/hUpgy2MPpnDOgs1EGhCl5
 A9FE09k7xzRRflxsBUWNcqg1vJ6kGPc/F/GacyruzFag7q2JzouwnSVLKWBOnhu69z5ASJLAA+r
 9eg46twjH0SkyIHvGMjx5MkExKb9YsPKsN4poQtX45xPK1SneR5/Hz+JChRSp4ltEgZe1FiRfPN
 bgwylYpsBLBB+rRjUJzTwDfjxeZ/PwsP71WartOPJFOSmoBTw79vEhUkaFLvSc8WtCD+TUrHINI
 JiMeol2MrlUQw+wU2Peefv7TFY6tp/Zu+GBTkX6Ink8SFMUoalEKBokRB83RrW5TOZb99ndla+q
 oSYVi4iU59YTgJVNmrOZp5BtA9gjlw==
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=692d8daa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Gbw9aFdXAAAA:8 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8
 a=O6aiENeBtRji4m35reQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=9vIz8raoGPyDa4jBFAYH:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: Bb4GOcFEmRa-0jonIVQE8hOdmNz4llM0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010103

On 11/25/25 9:12 AM, Paul Sajna wrote:
> Also include other supporting msm drm nodes, including backlight
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> Co-developed-by: Amir Dahan <system64fumo@protonmail.com>
> Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

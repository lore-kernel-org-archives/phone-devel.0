Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295693BE65F
	for <phone-devel@vger.kernel.org>; Wed,  6 May 2026 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778058953; cv=none; b=UBpLdkqtQKfsEtmHibTGUA3U/AVmhyFF1vICZ3WvKqftTx248qpF3KRmmCENrKBBfLv+qllIGdsL3ebppTa1Sl72tLPJNvbaRQu45Lys8R/NA+nyyfnKAiYhWVENeL/CX2x9+HoHCnxO7LiIkO0BNIEnW7hRSVO+obqIVI3ERXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778058953; c=relaxed/simple;
	bh=R1VTK1OenYLQANLJ9pOLnRCk2qBsb/zjhelLvvj6tnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wi2tgj2h33U66yYnEq4j+hs67DMvN2AH6cExhpNO4pWN4AFQ3GUeyTD71eeb4AFF+vOHoH1+THgbHgZsUAAGHxmEiw2mIMmQvfbDXYroQ9U4exroIH8hD2KyYNVO0iYqH6ulbnfqsb5laGGkGcZ90uZ96xUWEXrKSCxBXFJVPXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8J9P/cn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L5ayhc/U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8J9P/cn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L5ayhc/U"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6466xW461515411
	for <phone-devel@vger.kernel.org>; Wed, 6 May 2026 09:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xRUBvLbwxgleTjfqDHxt9FzjXUjxTlhfB1y5akMaqTk=; b=I8J9P/cnmTS9O5PP
	XV6WLRnB1XFDyG7zt5Ph+E0nZhhh2vHgFSiYkzJSEiTWuUnhQzpKyNfAb7hzfHii
	1xQLR62my+DOIPtm4diSwM1OpGiHNnR9DiujbFJ9J+6QIAOaPMzobsyKORDkT22c
	9zeV9dewYOA57kUkGv55rQ1+Ce4hqQ1GSaQQfMuRif9ug0QNEUPTE5MgJQEqMY9b
	JlozKTQJnkABG4orrhVA2bEXXSxFP+RkYF+lcgNiUPF/kVGN/DgxM9FuGyzkxNtb
	G52F+9xuifJQIVrJO2DgB8vbbfww/b83A5DWBpMSLIMsJ5u44+/aqd/2wG2rsy9R
	fcK8xg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e00v1rn4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 06 May 2026 09:15:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eec753a7bdso217450385a.3
        for <phone-devel@vger.kernel.org>; Wed, 06 May 2026 02:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778058949; x=1778663749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xRUBvLbwxgleTjfqDHxt9FzjXUjxTlhfB1y5akMaqTk=;
        b=L5ayhc/UAwlFi1nNhNzqU5DYH/6p5fKkRD96M2LQYS2sqfjYpLGJkPuSYQ4vzwnOiN
         SYORFEXMvFJfd/o+FY/xYwTC5KThQvK1cSFVuN+D85mD2ymP4HVN1FrtzkXLOVwa9yzj
         wyWPryLfxbuPuqKfCX1oK3j5GkXydUqbwvpHHkDBRmv+0HF9Hj/7rlO2JNw5dmxzeM9Q
         7TTXhwWJVeAvmieaCRHQuiPPuCPpNrWYfTzsFuVS+Too0ophgg+pb/qE71n9aDKwpMtZ
         BftZAzgSNdSrQgCW80Iq06dav/VbK9tJ+iDbyblpbGfI3HLoatFE0FnEGZ2uKr4Nh0YN
         bR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778058949; x=1778663749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRUBvLbwxgleTjfqDHxt9FzjXUjxTlhfB1y5akMaqTk=;
        b=cbxU/Dr+URYAGL7r2pL/uuC1+XzdlXfZkwqZ3EJ23wkEotkrPgfCr+k6V2Bk3jJQuk
         Da27DRZcsgcEZLZlnUVZfBpFuBOLw38WjNfjvMND5lAPVJVcWhpZRLqIxBGt/ke8RylK
         ZFFBjAwYdB1ksDPnTUHXL3R8rzpzcom7sctiyzS5ntGhB85DMQ6P/NclActO1Skf2zZW
         7paCHeCAhRf/mtVvzbVQP4JYQ8RoP65N7R5cAqi8Uh4A8qT/RiGwwumR+lkBvWcgwULG
         FelA0KNLo8TPXR6vC09XOM4h8vbVbdn9tqdL7VnMeYtXvlR0nVqM3k31ADqxSy3tlSXF
         LmSg==
X-Forwarded-Encrypted: i=1; AFNElJ//4pK2xQFRhPFuIli+X8PpLNcjEjCPkTlnlmu3eupd4FFkLkwCsydGVnyoNlOLXrCCDCDuketzDArECQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Q6oSFKlJ8DUsD6Oz0/q91DxsifR15upjBksTrvihQD850hY4
	APxzXS93qw6cYJlc8U59/GlEE5ONWti7aSJqbidtNXGE4y4akuHMgha/Q5p/gWTUaCUnf134vKF
	WSbQqgPhWwXeBAXbKNEQQNOP8Kqf8dPX4dL6mgdIO/XCj29odZEgQy26CHFQvtBHLcA==
X-Gm-Gg: AeBDieuQjDI2rqccZjOugUtFu3eyXJWExE2R3QOlnJK87e8I2teQjcdeHwi6K4fPV70
	cJ1zorJw96MH0I/nT4Nb0cMRA4DCtccO3wEA68w983bYzSYPPyzH8QAHSOfqY99WapYzZH770n/
	xYIm+kD7/9jJTyT7UT9G7NJ/bNqdO6dYZjRA6xT1PnBHY3KB99n60UOKhBKhaZxfGMZ6a2HRdHD
	OJfZ9gzZ5O4rfRwcFKbpmKoZI51m0WmYJr/FTOSKUnIoV+n971jRUfAUlcB7E68mji6ARMNHszn
	EujNFfcQez6ivHVm5K+/f9kCwxAGlfbssmZ1aaJ57ev4qNtqgraa2pxI5WG7eTUcpc9Sp7S0Ey2
	kzHpqVLsms07vscTqVnbVGZ1EBnBiMd9JCV678+DqnHUN/m6LsMEezKSgh5kISIpIDtijpxASiv
	sGxpnJaQMxi1Pumg==
X-Received: by 2002:a05:620a:458f:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-904d10837bamr267956585a.0.1778058949485;
        Wed, 06 May 2026 02:15:49 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-904d10837bamr267954685a.0.1778058948898;
        Wed, 06 May 2026 02:15:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd91a4708sm1098481a12.14.2026.05.06.02.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:15:48 -0700 (PDT)
Message-ID: <3a4256b3-785a-4841-bd81-980cf4762d72@oss.qualcomm.com>
Date: Wed, 6 May 2026 11:15:45 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm6350: Add interconnects for GPU,
 MPSS & CDSP
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
 <20260505-sm6350-misc-v1-1-0b9efc22690c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-sm6350-misc-v1-1-0b9efc22690c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bvYwIL1EkeBij5W8q4nRmgbUdSyMVnew
X-Proofpoint-GUID: bvYwIL1EkeBij5W8q4nRmgbUdSyMVnew
X-Authority-Analysis: v=2.4 cv=cKXQdFeN c=1 sm=1 tr=0 ts=69fb06c6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA5MCBTYWx0ZWRfXwNPsM6MHEfAy
 t2Q4dNXGF+FWi2LIh4D7GTrxQDpih5R3LrrS8ZXvGA4DZ4AXznWsuNxqfJF0TiKnBMii0DdsCLI
 /DcASdV7mt1uMxR+t6/73QKlxlfNVkUohs6e87LeBavL8KDs9UPHm/ldRhBzhfqLHUG297phJyM
 0yMvbUICqOYqqDF0c1TTUw1PixM5GUOKmSTDJv9G28r8juuFj/itKPsFcp/Rxsij2sWQoeloGS7
 cGhVAtqQsbdUAQJsiHUU9ZRBf1bIZXf/EsGRowvZzABBwLSUMYPq5Thc6WVZYKOJ+xV2uR+M0GK
 Z6x3wMIxZ/Y3//2xfX2qEK3sKP4f/u9no3WNtLiTRN+POzNl/xdLOBOOIrcOsVJOcuuhkea6C8A
 VNntMheLVX5AmistT8Jgn7sS3vGkLPhQ19Srl5gkFkMOlMOiBMdZ3j7+76JarDBpgxbjYZcaVNH
 7j7VuDB9y1YFVC2QuqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060090

On 5/5/26 5:08 PM, Luca Weiss wrote:
> Add some interconnect paths for the GPU, the MPSS (modem) and CDSP.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

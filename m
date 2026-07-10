Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C95342641E
	for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 13:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691078; cv=none; b=dkV9Vw3KX6R5Imi7IvuUgHvaqWN6l9O77Jaxci2Lv3WSHdXZPZQl5AJ2GsBcoUSNpaTqRfyfU5R2OgOUFddPIG/qjouFO+1EwQfAMe0D0DBeI1D4qf65MUIb7Vka5Z8uQhKqkEBJ6MbOOsy4S85pLNsDsJQiT4xwo3xNnaPpKn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691078; c=relaxed/simple;
	bh=0mz3qJv0BDahOMHl4Qms0ZQnz0C2OdkzNWbTMJy9x1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KdebjbEK8Bn2PFfPVxi8pH9xOPml9fWDP/yXC04EMAgIYj638TPWsAOfvYOsLWlEsJqriFbl5uKTINP4fW0HmHIkmsL2kb1lAcDFLfcFBymsaNnrFbpzk8GBhsARtD47zKOxNeTIwJHt2I/nZaClMCgYCpQ0fg8OkkNlumZBomQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bo2UR+/H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iC7oRyNS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bo2UR+/H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iC7oRyNS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6OK0871560
	for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 13:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BajnQZ9UnlDgGNW46b/qmQ3nKKqo2dqOPhzq4QZBTBo=; b=bo2UR+/HPVjPOrD/
	fSVhw+Lz0XugpoOGYKugMdE89cXqjG49tK76ooDKuCz+kHyV7g18+NJdeHDGzP6d
	PTLTVKe4+vbIaTyzNbfISQsX3wrHehOlnxqMoMwCvETKwr8GgAn5J0c2Shj291Mx
	AnZ9H2dDDeUF8saWiDNqay/vCdZrPV2ioZEPN1v2q7RrUj8G7QNG2bkmStpL9la0
	Ft2PjJdPSSF2FgGSqqyyojeCLvKDC1VdAZDuQnc0Yp1JT8b+AxIs+VAunY5lKkgz
	6I59jdEsrRCnVl3cWBhOuW7zjbt/+ZnlvPu1Da0FJvKNgy1Zyk3wKYYXevd22vJJ
	xnop8w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faxyg8nyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 13:44:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-903694fd3bfso1031056d6.1
        for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 06:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691075; x=1784295875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BajnQZ9UnlDgGNW46b/qmQ3nKKqo2dqOPhzq4QZBTBo=;
        b=iC7oRyNSB04xyN2lusIc1uSxgNo07FlvQhOCChvl6gB624r4xGb84vq0i0zA64ZIeD
         Si66Vidg5zmBB4mCcwqwvbcGKTiRNOOX08/PW4zdLpPux6YXseXwsLTdN93Jm4kDaX1M
         LKtpuToulJZqC2k2SBybZRoEGwvIzFc/BHraeKrE2Il1UtPBamNND487YH3bIPaTWpx0
         tHXEOAqYUVEi/lQ+kYhQtMmlI99JAyZzWJALI1+Auem8qMco1IsjXFQYDy7F5RxRhFPA
         EF+imCMolEuK5xBouDn8oHER2ywBf3SsyigH8+ezH446UCp3M7HUt5fOZKN6h23b0I5I
         liaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691075; x=1784295875;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BajnQZ9UnlDgGNW46b/qmQ3nKKqo2dqOPhzq4QZBTBo=;
        b=eLpyFdBFDNFIy3AADm74es+YA3ROtE2oiFsWoIZB03YaBSn+JBuJ2h+xBPP1Pa3uuF
         Z5fMwuxueiU4IYH2Sm54DY6Zw2OPBrSbp3fuE0ZCS/CIKOseJ7mpwAGfrjduPegXh3+z
         MbzK1yK2qpM2SZqw1HlnGDa+AlSG0JiIm6N+ZkH3OPwAxY4CmKsz6cCSar1O3JPbRViN
         trDE3PjSupVgsbA2fYYELhTKe5dJCbNBaAr5d/CC14tvHJBHiJTl4iuJpkZ4RZpu929g
         P70mTHOpP4goRmvwYIyAHXwrBbODEbY6H/GSVCbF/4ozpVD+4IOBPPB1F3KEgQNeeVKf
         Kdiw==
X-Forwarded-Encrypted: i=1; AHgh+Roa5xZ7FxqQe9J3ItC4pLh4Mu2QSMKMU8XEiLcClW2h83n+C4U8Xl3DKEGnnKWLHaD3o9oeM9xactgq6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXyrOMQlFUyw6sXeUEFJyiIoxnlPIb6729wjVAGUTmd7LE9iWN
	g86Gzi3V1ndVcPOBUibbHHAlOzMdfJz2X2yX6OaBK20grnTwLosuz1g/8Wc0HF1njE3wskt6Dcz
	cZ/liUYX9A2V5lEw3mGuOPMI4hllCUcihI6ddgd4clF73NumFfUclPGZOzpXTwdf6bA==
X-Gm-Gg: AfdE7clVtvPsW/SpSB8yyKS2mIxKTHDWPBlMcRfUdzjuoZHLAyQAQ7LQqDsO6Olysoo
	nxYIF9SanLJCvfMosUkD3737L8al15rIxR6L4RhHeaiy5JIQyekMSk4GnAryy3cridqWmgWjs+m
	WsgYTdFaTGSwcIjZMMW+6kkWncuUV81Qmk3JRsNnXIw5Bn3BzzElFVZ36+960gjacRrYNWB0E8X
	34wUvETyfpOVWw0Z0ZDNoFHlYO51KRGb5BAOoAgmUPPxniQlfPv914K5jhdd8R1L/QJxk++MlHO
	SDjOoxTAqFPjYb+zeliULppy/mmodlOTxO//x4BOgA59DEkRpbOPvqyL7QDi8ouZsCL+9IIlVYv
	4l8MKK5OeplIiGqsLstRHtivMs2hBVAUVOJg=
X-Received: by 2002:a05:6214:1d0c:b0:8fd:80cc:e9ad with SMTP id 6a1803df08f44-8fec7355228mr108739716d6.6.1783691075650;
        Fri, 10 Jul 2026 06:44:35 -0700 (PDT)
X-Received: by 2002:a05:6214:1d0c:b0:8fd:80cc:e9ad with SMTP id 6a1803df08f44-8fec7355228mr108739326d6.6.1783691074996;
        Fri, 10 Jul 2026 06:44:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69acd3e06d6sm3254661a12.26.2026.07.10.06.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:44:33 -0700 (PDT)
Message-ID: <bf766035-54fa-4e98-8abe-22cf0a229ffa@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:44:29 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: milos: add OSM L3 node
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
 <20260710-milos-cpu-opp-v1-2-ae7f4b09bc77@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-milos-cpu-opp-v1-2-ae7f4b09bc77@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MJWpJbPsFImhQcGcj2DRHLFKyV5wBP2B
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a50f744 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6H0WHjuAAAAA:8 a=75QiWgRGdHY30H_rKSEA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfXws41Oh55729X
 e2/kgNxWjexOvdCm0rMY+x+Q4ZEYNq8Ed87lTbmZvthz8gSIWKG6sJQIOsR1xyThNa7hhUvNury
 ly+ylxAuyahER5ev3nBEMkAayqaEVrs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX8LbgdYLYjGGL
 fAiwwB4QFU+WNVRDzsPC0KyCRPRjg4t4WoHzTG16GdgSmZaBZGpm6w2h1L8OYwT0wwON2ZxwSdw
 XK8TfilqhNiYGX0aP78JTSsLDH2Weq//mcnlUWJd5CIzWSpTfoFF2wo873lCKKoGA9rnUFJiD16
 Zm5yUZS41n4bAK0Z1zc0Q99IZoYHGLz77+O65FbjJrH2ul3kPWUrcf+wdivKW5DFmfPhLy7xwZE
 joFQ2GKgeyS24fh4AAbGHU/2N88xzUg0jUNq0yx/83HuNhddf6c5bbyT4vkaaZwMYFRlRMHCTZf
 y75qCZRnElHI4DJ0gtVuYYHoX4AfQhEHe5xdvdeZPmWVD3x6qgxTZ6h026EqnOEEILujpeWE6PP
 9J7dH7ANSh1HDZD56PRMbqU7mzp0FEQihl2252zSH0EN7R3kRnqEhf46fS0fGUnBNMb5kKjKXyW
 sV6tilIeHWiKm514htA==
X-Proofpoint-GUID: MJWpJbPsFImhQcGcj2DRHLFKyV5wBP2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100136

On 7/10/26 11:22 AM, Luca Weiss wrote:
> Add the OSC L3 Cache controller node.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

I'd suggest to squash this series into 1 big patch, without patch
3 applied the OSM driver will engage and perform sync_state (with
0 requests, so it will vote for 0/lowest) and the system
performance will be tragic

Konrad

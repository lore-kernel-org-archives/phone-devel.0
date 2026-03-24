Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1554388E79
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774320496; cv=none; b=VBZknIc9Ya0sr5J6FL8j8BSLkQr62w6LQQlaKfXKKG1fx6PF2+BG1xLUDBA0EvgBQEXqV3ghK2Xx0Fd+ijZ/gkmnC9GkPLk+lAlUkf1Vf1yIGoBRnq846/OhHMKQaL44Y3BNb86rtPkr7utnN6z4/QltMt/IoTf4ggiQsVcYGG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774320496; c=relaxed/simple;
	bh=Tmd+gxRh0zMc7goWZkYjDkOhd7+39w5YPSm0QADkkW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+Xf+3JtHDwSv1kloanB48KwO2OKYoiV/K3NBINaGi4jvsBE3hT/SuV9bbUDldeh1Y2bTookIngJtWZpecrBLDPN/yo+9i9EW/lJ9ZJc7ZUeqdkeTpzunjwCChomHxTADXWwTN/7vm2BHqdlLKym8QjzEYqBvnMQpM0eaTFsyxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inMpW2fW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I3IX4E/u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inMpW2fW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3IX4E/u"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NIZ1WU1909349
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U3vJrTCvtA5VbYGj6R/QkEk6
	GFV0eo4cVRNuQ+yDIqQ=; b=inMpW2fWU/qSTmX2KSH6MMXIdDKqKmJ8nvKaG13x
	ntEXhARKCDcftvRPRDUUIaZPWUUlkgzn5w0PQpUGEoevgE341E1Wod6xvWzjkmvR
	iI1PUikH5RdP+gqyOZzjzmnFjlfhazQqAl+Z9f5E4/6gmTWBUOaeE30sdFGiui/G
	K3sdDjnq+jvg8kkgnSGNm7phiCXOaZ9ZtDPet1DTErOyQ1FIxAYGnOXgMnD4NPUU
	kYaag5Yk98NkOsuqwJBHkecciGzS2/ScU9wHeB62v949X3Fm80HTINHVVOeTGltM
	GDaE92RqmNG2QscAnzUVdwQ8aiMqYfuZNt2tqB1KFHrObw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3awyscy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:48:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c0ba59a830so3881049eec.0
        for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 19:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774320492; x=1774925292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3vJrTCvtA5VbYGj6R/QkEk6GFV0eo4cVRNuQ+yDIqQ=;
        b=I3IX4E/uffIBr+0oo0271hTLYP1a9CZuNRvnG0auRsuNV+s2xQ2R0lZGGActEbfsfl
         8KoFyAirgVUlmSETDCqY7PqgRL3thAN+cLoobQzeRXh79AwVHo6tolO6HNu5KstC5dZg
         /I5bPJ7eIkt34vrwhGWj0TTHzqYrmInZAcKbl54J9XIgW0qka4mvz+eDLcgiIcZ17p7A
         66Z4NRIshSXrV6UkH5QTM2MfzVbFfhwbsH2jtBXnb0MxFkXBZLHoBylMDRNio3rjwHAh
         0JE7EntGfEUhgzth1Bnvxz3hU8r0dpio7s4UMf4EK/qepMb0xrpkzJZuK20cYhl1c0d5
         m65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774320492; x=1774925292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3vJrTCvtA5VbYGj6R/QkEk6GFV0eo4cVRNuQ+yDIqQ=;
        b=a8UTnY3mtGSI1jbCHMsfvB3ifaDjvUhDH+0il/Xqss/1k4+eHqObloNov7BFcWyPTi
         HMX1NozH5xHXVnxZDxkxVSeSVULkgU2bs2w39wmNHf2nJDrwodOfMgqexJ2cIZ5l0FCM
         n8Sxy8ih6MGBj7uYxgwj+geSztFkZyzImahj2d69hqkFq/l/7Bd5OoQkmgmN11GOEAYc
         Rgnx1VdKOqJ1Gn6N6LfvXYNczh8IbiAkiNJSGjxBCc+2eUPhv9PcXvsrqImSbIN0eeBz
         Nm2MyIKBXNawLdNBDByjyiNG4xH4iFOmHRXxpk8W3OKBE54Xr8dm3yKsS3qtUZsgfhEN
         iYdA==
X-Forwarded-Encrypted: i=1; AJvYcCVyN/MtHTKNksLB6axBZQ8457ck7v6PgEwUPBGgNaLOjecqq0YcVHaeS621bHe6gJXj4He5QViTH1cLQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YypAHyNSty13a1B7KTWWVGUrVJifFkh3QggOxfxZQX/TP1Bt8LK
	jFkBYNzyAUX59gXcWB9Fv0TXb6uqqIkZdF/NDt/hzIcUwEj+TTTsEvQrOwR/gxiex0dyX1c2P7M
	IfcZSqKgVjw2VwJ9Arhr6tV/TeQO7232DkVi+WzaBscENu3dmksiOHifjSkqMneWmoQ==
X-Gm-Gg: ATEYQzxUcB6FJHBGycAB7P+GT6mLFwpx3Ba7rF++4WaVKx/ECxGtIW3R/YEhedvV5wD
	wkVIdLVk0nNVqkT0AW3BsQes6ESBK2wL0sSfMkaPrOV6ra+mT4nQH9gS+M6zfCIxscy/Yze8LpE
	HYxFEfCTCjR/b0z6f1jVkVaOFuuoZrdEcORTZmK797Gn91wTU2jSl5ZZYQdFlg1C8+V2yAbvEJA
	7S/HtwnvRBBbJ7hneCcb67ZuTgv+4SPuJqvFpCTxYn+QMUBErhNB38hoo+tqH8ZVUvZY7chEsMG
	3uAa2vHrwVSHceTBrdOsoCZo0QstwAj3gisr//dN2Cheys0YuR8NJHT7OHWBkt4zL117UJoQzXV
	lggEF3D0y9GOHa40wxFk3tGrrgiDcI9vWiwPT6+4kWWePeW8Jh4FA0a+DGfOjyyv2RlnNGUzZLY
	w=
X-Received: by 2002:a05:7300:fb89:b0:2be:10a6:647e with SMTP id 5a478bee46e88-2c1096d56e4mr6573523eec.19.1774320492028;
        Mon, 23 Mar 2026 19:48:12 -0700 (PDT)
X-Received: by 2002:a05:7300:fb89:b0:2be:10a6:647e with SMTP id 5a478bee46e88-2c1096d56e4mr6573494eec.19.1774320491396;
        Mon, 23 Mar 2026 19:48:11 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b3253d0sm14093923eec.29.2026.03.23.19.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:48:10 -0700 (PDT)
Date: Mon, 23 Mar 2026 19:48:08 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: clock: qcom,milos-camcc: Document
 interconnect path
Message-ID: <acH7aEBvSbiNwhBz@hu-mdtipton-lv.qualcomm.com>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-2-400b7fcd156a@fairphone.com>
 <20260117-efficient-fractal-sloth-aaf7c2@quoll>
 <59d9f7ff-4111-4304-a76c-40f4000545f5@oss.qualcomm.com>
 <9f8619d4-43ac-4bc0-9598-c498d59a27b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f8619d4-43ac-4bc0-9598-c498d59a27b8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAyMCBTYWx0ZWRfX3sfr8SOyxmi0
 +sNv+6uEhygJfmbKkomlbL5Zvhk5PXlewkHNWMys+Fe+61vEvzfWDNTbDE/H8cDMX7v7MqF19gq
 3rdXdu4XlWctDnMg5VVtwJPsvuX+p0SW1XZSqkYJgXqRq49DRU6Ty2DW7t9A5ahTNyP9EBbkqfM
 m55QCOLLyqaKyt6fu2H24/1EFF/aPrSiFa+6fpay7i/SakzCVa7P8BCrWv/jniPA8PHVc0/+2/B
 RdbzFOJ4gzEq64R679tgzCcDfVhZ3UJ6fbsr6WXkYLEwtceWeixFMf/tUpmlrXUyyiFzsDnSflj
 mXUWbek2w/Cd8YAdCHH9aGmuJSUUY5owz5SOaI8XaiHLlQXiMQFYnI8D/CjJ77FTjKzbcDLGWEG
 G72bZ6aSwWpi8ViuanGV84gAzjN+2JLbv0jFMyPOF+SrmALwXBtE2AfrpdRdtaQBX9psTj9Ap1s
 uwErkZdlTebvntnS66w==
X-Proofpoint-ORIG-GUID: xPPBjcxiw1IhIs4eosf9htCGiuYk2KDQ
X-Authority-Analysis: v=2.4 cv=KuhAGGWN c=1 sm=1 tr=0 ts=69c1fb6c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=fekkFCTB2vo3PLuB2O8A:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: xPPBjcxiw1IhIs4eosf9htCGiuYk2KDQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240020

On Mon, Jan 19, 2026 at 11:28:07AM +0100, Konrad Dybcio wrote:
> 
> 
> On 1/19/26 11:20 AM, Konrad Dybcio wrote:
> > On 1/17/26 12:46 PM, Krzysztof Kozlowski wrote:
> >> On Fri, Jan 16, 2026 at 02:17:21PM +0100, Luca Weiss wrote:
> >>> Document an interconnect path for camcc that's required to enable
> >>> the CAMSS_TOP_GDSC power domain.
> >>
> >> I find it confusing. Enabling GDSC power domains is done via power
> >> domains, not via interconnects. Do not represent power domains as
> >> interconnects, it's something completely different.
> > 
> > The name of the power domains is CAMSS_TOP_GDSC (seems you misread)
> > 
> > For the power domain to successfully turn on, the MNoC needs to be
> > turned on (empirical evidence). The way to do it is to request a
> > nonzero vote on this interconnect path
> > 
> > (presumably because the GDSC or its invisible providers require
> > something connected over that bus to carry out their enable sequences).

The GDSC itself shouldn't depend on MMNOC in order to turn on properly.
It should turn on just fine without it. There *is* a dependency between
CAM_TOP_GDSC and MMNOC, but it's in the opposite direction.

For MMNOC to turn off properly when all BW votes are removed, the
CAM_TOP_GDSC must already be off. If CAM_TOP_GDSC is still on when MMNOC
starts turning off, then MMNOC will get stuck in its collapse sequence.
MMNOC waits for all HW clients to de-assert their active signals before
it'll allow itself to collapse. Most HW blocks assert this active signal
more dynamically than camera does rather than tying it to GDSC state.
The GDSC asserting active signals to RPMh that prevent NOC collapse is
unique to this particular camera GDSC.

If MMNOC BW is removed when CAM_TOP_GDSC is still enabled, then it
should reproduce as an icc_set_bw() failure on MMNOC rather than a GDSC
enable failure. The icc_set_bw(0) request would succeed because RPMh
immediately ACKs down requests, but the collapse sequence would get
stuck in the background. Later, when someone calls icc_set_bw() again
with a non-zero BW to enable MMNOC, then that request would fail because
MMNOC is still stuck in the prior collapse sequence.

Note I haven't explicitly confirmed the Milos behavior, but this has
been the HW dependency for at least several generations of chips now.
I've never seen this GDSC get stuck turning on because MMNOC if off, nor
would I be able to explain offhand why that would happen. But MMNOC
certainly does depend on this GDSC for the reasons stated above.

So, regardless of the originally stated rationale, CAM_TOP_GDSC voting
on MMNOC *is* a logical requirement to guarantee that MMNOC doesn't turn
off when the GDSC is still on. Otherwise, that requirement would be left
entirely up to consumers to understand and enforce.
